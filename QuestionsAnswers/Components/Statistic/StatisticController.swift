//
//  StatisticController.swift
//  QuestionsAnswers
//
//  Created by Denis Molkov on 18.07.2021.
//

import UIKit

class StatisticController: UIViewController {

    @IBOutlet weak var statisticTable: UITableView!
    
    private let statistic = GameSingleton.shared.statistic
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statisticTable.delegate = self
        statisticTable.dataSource = self
    }
}


extension StatisticController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        statistic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statisticCell", for: indexPath) as! StatisticCell
        cell.dateLabel.text = statistic[indexPath.item].dateLabel
        cell.resultLabel.text = String(statistic[indexPath.item].result)
        return cell
    }
    
    
}
