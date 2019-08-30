//
//  iOS_Introduction_to_Unit_Testing_LabTests.swift
//  iOS-Introduction-to-Unit-Testing-LabTests
//
//  Created by Mariel Hoepelman on 8/29/19.
//  Copyright © 2019 Mariel Hoepelman. All rights reserved.
//

import XCTest
@testable import iOS_Introduction_to_Unit_Testing_Lab

class iOS_Introduction_to_Unit_Testing_LabTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    private func getDataFromJSON() -> Data {
        guard let pathToData = Bundle.main.path(forResource: "jokesJSON", ofType: "json") else {fatalError("couldn't get data fron JSON file called sampleData.json")}
        let url = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch let jsonError {
            //in case we cant get data
            fatalError("couldn't get data fron JSON file: \(jsonError)")
        }
    }
    
    func testGetDataFromJSON() {
        let data = getDataFromJSON()
        let jokes = Jokes.getJoke(from: data)
        XCTAssert(jokes != nil, "Found nil")
    }
    
    func testJSONHasFourProperties() {
        let data = getDataFromJSON()
        let jokes = Jokes.getJoke(from: data)
        XCTAssert(jokes?.count == 10, "Error")
    }
    
    private func getMovieDataFromJSON() -> Data {
        guard let pathToData = Bundle.main.path(forResource: "StarWarsJSON", ofType: "json") else {fatalError("couldn't get movie data fron JSON file called starWarJSON.json")}
        let url = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch let jsonError {
            //in case we cant get data
            fatalError("couldn't get data fron JSON file: \(jsonError)")
        }
    }
    
    func testGetMovieFromJSON() {
        let data = getMovieDataFromJSON()
        let movies = ResultsWrapper.getMovies(from: data)
        XCTAssert(movies != nil, "Found nil in movie JSON")
    }
    
    func testMovieJSONHasFourObjects() {
        let data = getMovieDataFromJSON()
        let movies = ResultsWrapper.getMovies(from: data)
        XCTAssert(movies?.results.count == 7, "Error")
    }
    
}
