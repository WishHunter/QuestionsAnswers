//
//  GameController.swift
//  QuestionsAnswers
//
//  Created by d.molkov on 13.07.2021.
//

import UIKit

protocol GameControllerDelegate: AnyObject {
    func didEndGame(lastGuestion: Int)
}

class GameController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answersCollection: UICollectionView!
    
    let questions: [Question] = Question.createQuestions
    private var countQuestions: Int?
    private var lastQuestion: Int = 0
    weak var gameDelegate: GameControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if GameSingleton.shared.gameSession != nil {
            lastQuestion = GameSingleton.shared.gameSession?.activeAnswerIndex ?? 0
        } else {
            GameSingleton.shared.gameSession = GameSession()
            gameDelegate = GameSingleton.shared.gameSession
        }
        
        countQuestions = questions.count
        
        answersCollection.delegate = self
        answersCollection.dataSource = self
        questionLabel.text = questions[lastQuestion].question
    }
}

extension GameController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            let collectionViewWidth = Int(self.answersCollection.bounds.width)
            let width = collectionViewWidth / 2
            let height = width / 2
            
            return CGSize(width: width - 5, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "answerCell", for: indexPath) as! AnswerViewCell
        
        cell.answer.text = questions[lastQuestion].answers[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if questions[lastQuestion].answers[indexPath.item] == questions[lastQuestion].correctAnswer,
           lastQuestion < (countQuestions ?? 1 - 1) {
            lastQuestion += 1
            questionLabel.text = questions[lastQuestion].question
            answersCollection.reloadData()
        } else {
            gameDelegate?.didEndGame(lastGuestion: lastQuestion)
            dismiss(animated: true, completion: nil)
        }
    }
    
    func finishGame() {
        GameSingleton.shared.setResult(result: lastQuestion, count: countQuestions ?? lastQuestion)
        GameSingleton.shared.endGame()
    }
}
