//
//  AlertController.swift
//  MusicTrivia
//
//  Created by Julia Carlsson on 2020-07-09.
//  Copyright © 2020 Kristin Samuels . All rights reserved.
//

import UIKit

extension TriviaViewController {
    
    func alertController(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let restartAction = UIAlertAction(title: "restart game!", style: .default) { (action) in
            self.score = 0
            self.questionCount = 0
            self.fetchQuestionAndUpdateViews()
        }
        alert.addAction(restartAction)
        present(alert, animated: true)
    }
}
