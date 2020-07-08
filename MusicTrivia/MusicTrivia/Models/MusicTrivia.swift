//
//  MusicTrivia.swift
//  MusicTrivia
//
//  Created by Kristin Samuels  on 7/8/20.
//  Copyright © 2020 Kristin Samuels . All rights reserved.
//

import Foundation

struct TopLevelDictionary: Decodable {
    var results: [MusicTrivia]
}

struct MusicTrivia: Decodable {
    private enum CodingKeys: String, CodingKey {
        case question
        case correctAnswer = "correct_answer"
    }
    
    var question: String
    var correctAnswer: String
}
