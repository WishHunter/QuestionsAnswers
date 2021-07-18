//
//  GameController.swift
//  QuestionsAnswers
//
//  Created by d.molkov on 13.07.2021.
//

import UIKit

protocol GameControllerDelegate: AnyObject {
    func updateActiveAnswer(lastGuestion: Int)
}

class GameController: UIViewController {

    
    @IBOutlet weak var statistic: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answersCollection: UICollectionView!
    
    private var countQuestions: Int?
    private var lastQuestion: Int = 0
    private var createQuestionsStrategy: CreateQuestionsStrategy {
        switch sequence {
        case .consistently:
            return ConsistentlyCreateQuestions()
        case .random:
            return RandomCreateQuestions()
        }
    }
    
    var sequence: SequenceEnum = GameSingleton.shared.sequence
    var questions: [Question]?
    weak var gameDelegate: GameControllerDelegate?
    
    //MARK: - initial
    override func viewDidLoad() {
        super.viewDidLoad()
            
        questions = self.createQuestionsStrategy.createQuestions()
        
        if GameSingleton.shared.gameSession != nil {
            lastQuestion = GameSingleton.shared.gameSession?.activeAnswerIndex.value ?? 0
        } else {
            GameSingleton.shared.gameSession = GameSession()
            gameDelegate = GameSingleton.shared.gameSession
        }
        
        countQuestions = questions?.count
        answersCollection.delegate = self
        answersCollection.dataSource = self
        questionLabel.text = questions?[lastQuestion].question
        
        GameSingleton.shared.gameSession?.activeAnswerIndex.addObserver(self, options: [.initial, .new], closure: {
            [weak self] (index, _) in
            guard let self = self else { return }
            
            self.statistic.text = "Вопрос \(index) из \(self.countQuestions ?? index). \(index * 100 / (self.countQuestions ?? index))% заверешено"
        })
    }
}
//MARK: - collectionSetings
extension GameController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            let collectionViewWidth = Int(self.answersCollection.bounds.width)
            let width = collectionViewWidth / 2
            let height = width / 2
            
        return CGSize(width: width - 2, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "answerCell", for: indexPath) as! AnswerViewCell
        
        cell.answer.text = questions?[lastQuestion].answers[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if questions?[lastQuestion].answers[indexPath.item] == questions?[lastQuestion].correctAnswer,
           lastQuestion < (countQuestions ?? 1 - 1) {
            lastQuestion += 1
            questionLabel.text = questions?[lastQuestion].question
            answersCollection.reloadData()
        } else {
            finishGame()
            dismiss(animated: true, completion: nil)
        }
        gameDelegate?.updateActiveAnswer(lastGuestion: lastQuestion)
    }
    
    func finishGame() {
        GameSingleton.shared.setResult(result: lastQuestion, count: countQuestions ?? lastQuestion)
        GameSingleton.shared.endGame()
    }
}
