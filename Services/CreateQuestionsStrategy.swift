//
//  CreateQuestionsStrategy.swift
//  QuestionsAnswers
//
//  Created by Denis Molkov on 17.07.2021.
//

import Foundation

protocol CreateQuestionsStrategy {
    func createQuestions() -> [Question]
}

final
class ConsistentlyCreateQuestions: CreateQuestionsStrategy {
    func createQuestions() -> [Question] {
        return GameSingleton.shared.questions
    }
}

final
class RandomCreateQuestions: CreateQuestionsStrategy {
    func createQuestions() -> [Question] {
        var questions: [Question] = GameSingleton.shared.questions
        questions.shuffle()
        return questions
    }
    
    
}
