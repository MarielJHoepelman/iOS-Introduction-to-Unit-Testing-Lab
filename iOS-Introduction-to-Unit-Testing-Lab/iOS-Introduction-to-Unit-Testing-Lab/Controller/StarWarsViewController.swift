//
//  StarWarsViewController.swift
//  iOS-Introduction-to-Unit-Testing-Lab
//
//  Created by Mariel Hoepelman on 8/30/19.
//  Copyright © 2019 Mariel Hoepelman. All rights reserved.
//

import UIKit

class StarWarsViewController: UIViewController {
    
    var movies: ResultsWrapper!

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
        
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try
                Data(contentsOf: url)
            
            let moviesFromJSON = try
                ResultsWrapper.getMovies(from: data)
                movies = moviesFromJSON!
        } catch {
            print(error)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let movieDVC = segue.destination as? StarWarsDetailedViewController else {fatalError("Destination not found")}
        
        guard let selectedIndexPath = movieTableView.indexPathForSelectedRow else {fatalError()}
        
        movieDVC.movieSelected = movies?.results[selectedIndexPath.row]
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
        cell?.textLabel?.text = movies?.results[indexPath.row].title
        cell?.textLabel?.numberOfLines = 0
        return cell!
    }
    
    
}
