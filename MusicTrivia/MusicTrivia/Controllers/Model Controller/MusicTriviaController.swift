//
//  MusicTriviaController.swift
//  MusicTrivia
//
//  Created by Kristin Samuels  on 7/8/20.
//  Copyright © 2020 Kristin Samuels . All rights reserved.
//

import Foundation


struct StringConstants {
    fileprivate static let baseURL = "https://opentdb.com/api.php"
    fileprivate static let amountQueryKey = "amount"
    fileprivate static let amountComponent = "1"
    fileprivate static let categoryQueryItem = "category"
    fileprivate static let categoryComponent = "12"
    fileprivate static let typeQueryItem = "type"
    fileprivate static let typeComponent = "boolean"
}

class MusicTriviaController {
    
    //https://opentdb.com/api.php?amount=1&category=12&type=boolean
    
    
    static func fetchTrivia( completion: @escaping (Result<MusicTrivia, MusicTriviaError>) -> Void) {
        
        guard let baseURL = URL(string: StringConstants.baseURL) else {return completion(.failure(.invaildURL))}
       
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        let amountQueryItem = URLQueryItem(name: StringConstants.amountQueryKey, value: StringConstants.amountComponent)
        let categoryQueryItem = URLQueryItem(name: StringConstants.categoryQueryItem, value: StringConstants.categoryComponent)
        let typeQueryItem = URLQueryItem(name: StringConstants.typeQueryItem, value: StringConstants.typeComponent)
        
        components?.queryItems = [amountQueryItem, categoryQueryItem, typeQueryItem]
        
        guard let finalURL = components?.url else {return completion(.failure(.invaildURL))}
            print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            guard let data = data else { return completion(.failure(.noData))}
            do {
                print(data)
                let topLevelDictionary = try
                    JSONDecoder().decode(TopLevelDictionary.self, from: data)
                let triviaItemArray = topLevelDictionary.results
                guard let trivaItem = triviaItemArray.first else {return}
                return completion(.success(trivaItem))
            } catch {
                return completion(.failure(.unableToDecode(error)))
            }
        }.resume()
    }
}

