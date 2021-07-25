//
//  MainController.swift
//  QuestionsAnswers
//
//  Created by d.molkov on 13.07.2021.
//

import UIKit

class MainController: UIViewController {

    @IBOutlet weak var lastResult: UILabel!
    @IBOutlet weak var startLabel: UIButton!
    @IBOutlet weak var resultLabel: UIButton!
    @IBOutlet weak var settingLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GameSingleton.shared.lastResult.addObserver(self, options: [.initial, .new], closure: {
            [weak self] (index, _) in
            guard let self = self else { return }
            let lastResultValue = GameSingleton.shared.lastResult.value
            let lastResultPercent = lastResultValue * 100 / GameSingleton.shared.questions.count
            self.lastResult.text = "Последний результат: \(lastResultValue) из \(GameSingleton.shared.questions.count). \(lastResultPercent)% завершено"
        })
    }
}

