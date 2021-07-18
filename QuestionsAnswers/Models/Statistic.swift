//
//  Statistic.swift
//  QuestionsAnswers
//
//  Created by d.molkov on 15.07.2021.
//

import Foundation

struct Statistic: Codable {
    var date: Date
    var dateLabel: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY HH:mm"
        return dateFormatter.string(from: date)
    }
    var result: Int
}
