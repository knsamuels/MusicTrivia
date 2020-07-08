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
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Actions
    @IBAction func trueButtonTapped(_ sender: UIButton) {
        //if tapped & correct, change to green and add to score
        //wait 0.2 seconds and update screen
        
    }
    
    @IBAction func falseButtonTapped(_ sender: UIButton) {
        
        
    }
    
    
    //MARK: - Helper Methods
    
    //fetch question & answer -- set questionLabel
    
    
}


//Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateUI), userInfo:nil, repeats: false)



