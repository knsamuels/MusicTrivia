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
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
        case .invaildURL:
            return "Unable to reach the server"
        case .thrownError(let error):
            return error.localizedDescription
        case .noData:
            return "The server responded with no data"
        case .unableToDecode:
            return "The server responded with bad data"
        }
    }
}
