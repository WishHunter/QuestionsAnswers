//
//  StatisticCaretaker.swift
//  QuestionsAnswers
//
//  Created by Denis Molkov on 15.07.2021.
//

import Foundation

final
class StatisticCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "statistic"
    
    func save(stat: [Statistic]) {
        do {
            let data = try encoder.encode(stat)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func load() -> [Statistic] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        
        do {
            return try decoder.decode([Statistic].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
