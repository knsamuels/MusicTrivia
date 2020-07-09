//
//  TriviaViewController.swift
//  MusicTrivia
//
//  Created by Bryan Workman on 7/8/20.
//  Copyright © 2020 Kristin Samuels . All rights reserved.
//

import UIKit

class TriviaViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var correctAnswer: String = ""
    var score: Int = 0
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchQuestionAndUpdateViews()
    }
    
    //MARK: - Actions
    @IBAction func trueButtonTapped(_ sender: UIButton) {
        checkAnswerTrue()
    }
    
    @IBAction func falseButtonTapped(_ sender: UIButton) {
        checkAnswerFalse()
    }
    
    
    //MARK: - Helper Methods
    func checkAnswerTrue() {
        if correctAnswer == "True" {
            score += 1
            scoreLabel.text = "Score: \(score)"
            trueButton.backgroundColor = .green
        } else {
            trueButton.backgroundColor = .red
        }
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(fetchQuestionAndUpdateViews), userInfo:nil, repeats: false)
    }
    
    func checkAnswerFalse() {
        if correctAnswer == "False" {
            score += 1
            scoreLabel.text = "Score: \(score)"
            falseButton.backgroundColor = .green
        } else {
            falseButton.backgroundColor = .red
        }
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(fetchQuestionAndUpdateViews), userInfo:nil, repeats: false)
    }
    
    @objc func fetchQuestionAndUpdateViews() {
        trueButton.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        falseButton.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        MusicTriviaController.fetchTrivia { (result) in
            switch result {
            case .success(let MusicTrivia):
                DispatchQueue.main.async {
                    self.questionLabel.text = MusicTrivia.question
                    self.correctAnswer = MusicTrivia.correctAnswer
                }
            case .failure(let error):
                print("There was an error fetching trivia questions -- \(error) -- \(error.localizedDescription)")
            }
        }
    }
    }
}



