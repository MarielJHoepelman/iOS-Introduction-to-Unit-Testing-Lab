//
//  starWarsModel.swift
//  iOS-Introduction-to-Unit-Testing-Lab
//
//  Created by Mariel Hoepelman on 8/30/19.
//  Copyright © 2019 Mariel Hoepelman. All rights reserved.
//

import Foundation

struct ResultsWrapper: Codable {
    let results: [Results]
    
    static func getMovies(from data: Data) -> ResultsWrapper? {
        do {
            let movie = try JSONDecoder().decode(ResultsWrapper.self, from: data)
            return movie
        } catch let decodeError {
            print("could not decode info \(decodeError)")
            return nil
        }
    }
}

struct Results: Codable {
    let title: String
    let opening_crawl: String
}
