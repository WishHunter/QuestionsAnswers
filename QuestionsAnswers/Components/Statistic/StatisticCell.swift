//
//  StatisticCell.swift
//  QuestionsAnswers
//
//  Created by Denis Molkov on 18.07.2021.
//

import UIKit

class StatisticCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
