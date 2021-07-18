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
    var lastResult = Observable<Int>(0)
    var sequence: SequenceEnum = .consistently
    var questions: [Question] = Question.createQuestions
    var statistic: [Statistic] = [] {
        didSet {
            statisticCaretaker.save(stat: statistic)
        }
    }
    var customQuestions: [Question] = [] {
        didSet {
            questionsCaretaker.save(questions: customQuestions)
            guard let question = customQuestions.last else { return }
            questions.append(question)

        }
    }
    private let statisticCaretaker = StatisticCaretaker()
    private let questionsCaretaker = QuestionsCaretaker()
    
    private init() {
        statistic = statisticCaretaker.load()
        customQuestions = questionsCaretaker.load()
        questions.append(contentsOf: customQuestions)
    }
    
    
    
    func setResult(result: Int, count: Int) {
        var intermediatePersent: Double = 0.0
        
        statistic.append(Statistic(date: NSDate() as Date, result: result))
        statistic.forEach { cell in
            intermediatePersent += Double(cell.result) / Double(count)
        }
        
        lastResult.value = result 
        persent = Int(intermediatePersent * 100)
    }
    
    func endGame() {
        gameSession = nil
    }
}
