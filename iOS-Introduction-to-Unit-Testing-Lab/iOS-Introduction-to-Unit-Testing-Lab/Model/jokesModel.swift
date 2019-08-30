//
//  jokesModel.swift
//  iOS-Introduction-to-Unit-Testing-LabTests
//
//  Created by Mariel Hoepelman on 8/29/19.
//  Copyright © 2019 Mariel Hoepelman. All rights reserved.
//

import Foundation

struct Jokes: Codable {
    let id: Int
    let type: String
    let setup: String
    let punchline: String
    
    static func getJoke(from data: Data) -> [Jokes]? {
        do {
            let newJoke = try JSONDecoder().decode([Jokes].self, from: data)
            return newJoke
        } catch let decodeError {
            print("could not decode info \(decodeError)")
            return nil
        }
    }
}
