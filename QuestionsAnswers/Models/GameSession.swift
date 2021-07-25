//
//  GameSession.swift
//  QuestionsAnswers
//
//  Created by d.molkov on 14.07.2021.
//

import UIKit

class GameSession {
    var activeAnswerIndex = Observable<Int>(0)
    var countQuestions: Int = Question.createQuestions.count
    var gameController: UIViewController?
}

extension GameSession: GameControllerDelegate {
    func updateActiveAnswer(lastGuestion: Int) {
        activeAnswerIndex.value = lastGuestion
    }
}
