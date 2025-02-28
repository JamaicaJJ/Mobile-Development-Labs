//
//  ResultsViewController.swift
//  Personality Quiz
//
//  Created by David Santiago Jamaica Galvis on 2/27/25.
//

import UIKit

class ResultsViewController: UIViewController {
    var responses: [Answer]
    let frequencyOfAnswers: [AnimalType : Int]
    let mostCommonAnswer: AnimalType

    @IBOutlet weak var resultAnswerLabel: UILabel!
    
    
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        frequencyOfAnswers = responses.reduce(into: [AnimalType : Int]()) {(counts, answer) in
            counts[answer.type, default: 0] += 1
//            if let existingCount = counts[answer.type] {
//                counts[answer.type] = existingCount + 1
//            } else {
//                counts[answer.type] = 1
//            }
        }
        mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 >
            $1.1 }.first!.key
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }

    
    
    
    func calculatePersonalityResult() {
        _ = responses.reduce(into: [:]) {
            (counts , answer) in
            counts[answer.type, default: 0 ] += 1
        }
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
        
    }
}
