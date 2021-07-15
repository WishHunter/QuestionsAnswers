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
    
    var gameSession: GameSession? = nil
    var persent: Int = 0
    var statistic: [Statistic] = [] {
        didSet {
            statisticCaretaker.save(stat: statistic)
        }
    }
    private let statisticCaretaker = StatisticCaretaker()
    
    private init() {
        statistic = statisticCaretaker.load()
    }
    
    
    
    func setResult(result: Int, count: Int) {
        var intermediatePersent: Double = 0.0
        
        statistic.append(Statistic(date: NSDate() as Date, result: result))
        statistic.forEach { cell in
            intermediatePersent += Double(cell.result) / Double(count)
        }
        
        persent = Int(intermediatePersent * 100)
    }
    
    func endGame() {
        gameSession = nil
    }
}
