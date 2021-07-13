//
//  GameController.swift
//  QuestionsAnswers
//
//  Created by d.molkov on 13.07.2021.
//

import UIKit

class GameController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answersCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answersCollection.delegate = self
        answersCollection.dataSource = self
    }
}

extension GameController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {}

extension GameController: UICollectionViewDataSource {
        
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
        
        cell.answer.text = "test"
        return cell
    }
}
