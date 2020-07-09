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
    var correctAnswer: String = ""
    var score: Int = 0
    @IBOutlet weak var falseButton: UIButton!
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchQuestionAndUpdateViews()
    }
    
    //MARK: - Actions
    @IBAction func trueButtonTapped(_ sender: UIButton) {
        //if tapped & correct, change to green and add to score
        //wait 0.2 seconds and update screen
        checkAnswerTrue()
        
    }
    
    @IBAction func falseButtonTapped(_ sender: UIButton) {
        checkAnswerFalse()
        
    }
    
    
    //MARK: - Helper Methods
    func checkAnswerTrue() {
        if correctAnswer == "True" {
            score += 1
            
            
        }
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(fetchQuestionAndUpdateViews), userInfo:nil, repeats: false)
    }
    
    func checkAnswerFalse() {
        
    }
    
    @objc func fetchQuestionAndUpdateViews() {
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


//Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateUI), userInfo:nil, repeats: false)



