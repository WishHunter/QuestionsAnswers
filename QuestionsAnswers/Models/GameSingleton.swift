//
//  GameSingleton.swift
//  QuestionsAnswers
//
//  Created by d.molkov on 14.07.2021.
//

import Foundation

final
class GameSingleton {
    static let shared = GameSingleton()
    private init() {}
    
    var gameSession: GameSession?
}
