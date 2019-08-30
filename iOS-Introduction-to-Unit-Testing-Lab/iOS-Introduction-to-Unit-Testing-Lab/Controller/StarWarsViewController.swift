//
//  StarWarsViewController.swift
//  iOS-Introduction-to-Unit-Testing-Lab
//
//  Created by Mariel Hoepelman on 8/30/19.
//  Copyright © 2019 Mariel Hoepelman. All rights reserved.
//

import UIKit

class StarWarsViewController: UIViewController {
    
    var movie: ResultsWrapper!

    @IBOutlet weak var movieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTableView.delegate = self
        movieTableView.dataSource = self
        loadData()
    }
    
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "StarWarsJSON", ofType: "json") else {
            fatalError("Coudn't find star wars json file")
        }
        print(pathToJSONFile)
        //its a reference to the actual location  of the json file
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            //turn contents of file into usabel data
            let data = try
                //decode data to create
                Data(contentsOf: url)
            let moviesFromJSON = try ResultsWrapper.getMovies(from: data)
            movie = moviesFromJSON!
        } catch {
            print(error)
        }
    }
}

extension StarWarsViewController: UITableViewDelegate {
    
}

extension StarWarsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCell(withIdentifier: "movieCell")
        cell?.textLabel?.text = movie?.results[indexPath.row].title
        cell?.textLabel?.numberOfLines = 0
        return cell!
    }
    
    
}
