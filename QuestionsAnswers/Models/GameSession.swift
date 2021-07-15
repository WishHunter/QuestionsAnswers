//
//  GameSession.swift
//  QuestionsAnswers
//
//  Created by d.molkov on 14.07.2021.
//

import UIKit

class GameSession {
    var activeAnswerIndex: Int = 0
    var countQuestions: Int = Question.createQuestions.count
    var gameController: UIViewController?
}

extension GameSession: GameControllerDelegate {
    func didEndGame(lastGuestion: Int) {
        activeAnswerIndex = lastGuestion
    }
}
