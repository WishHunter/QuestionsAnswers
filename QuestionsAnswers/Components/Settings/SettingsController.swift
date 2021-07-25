//
//  SettingsController.swift
//  QuestionsAnswers
//
//  Created by Denis Molkov on 17.07.2021.
//

import UIKit

class SettingsController: UIViewController {

    @IBOutlet weak var sequence: UISegmentedControl!
    @IBOutlet weak var questionInput: UITextField!
    @IBOutlet weak var answerInput1: UITextField!
    @IBOutlet weak var answerInput2: UITextField!
    @IBOutlet weak var answerInput3: UITextField!
    @IBOutlet weak var answerInput4: UITextField!
    
    private var selectedSequence: SequenceEnum {
        switch sequence.selectedSegmentIndex {
        case 0:
            return .consistently
        case 1:
            return .random
        default:
            return .consistently
        }
    }
    
    //MARK: - lifecircle hooks
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sequence.selectedSegmentIndex = GameSingleton.shared.sequence.rawValue
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        GameSingleton.shared.sequence = selectedSequence
    }
    
    //MARK: - actions
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addQuestion(_ sender: Any) {
        guard questionInput.text != "",
              answerInput1.text != "",
              answerInput2.text != "",
              answerInput3.text != "",
              answerInput4.text != "",
              
              let question = questionInput.text,
              let correctAnswer = answerInput1.text,
              let otherAnswer1 = answerInput2.text,
              let otherAnswer2 = answerInput3.text,
              let otherAnswer3 = answerInput4.text else {
            print("error")
            return
        }
        
        let newQuestion = Question(question: question,
                                   answers: [correctAnswer, otherAnswer1, otherAnswer2, otherAnswer3].shuffled(),
                                   correctAnswer: correctAnswer)
        
        GameSingleton.shared.customQuestions.append(newQuestion)
        questionInput.text = ""
        answerInput1.text = ""
        answerInput2.text = ""
        answerInput3.text = ""
        answerInput4.text = ""
    }
}
