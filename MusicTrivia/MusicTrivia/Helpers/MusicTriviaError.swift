//
//  MusicTriviaError.swift
//  MusicTrivia
//
//  Created by Kristin Samuels  on 7/8/20.
//  Copyright © 2020 Kristin Samuels . All rights reserved.
//

import Foundation

enum MusicTriviaError: LocalizedError {
    case invaildURL
    case thrownError(Error)
    case noData
    case unableToDecode(Error)
}
