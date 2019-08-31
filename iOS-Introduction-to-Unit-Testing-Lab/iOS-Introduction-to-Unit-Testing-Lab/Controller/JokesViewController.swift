//
//  JokesViewController.swift
//  iOS-Introduction-to-Unit-Testing-Lab
//
//  Created by Mariel Hoepelman on 8/29/19.
//  Copyright © 2019 Mariel Hoepelman. All rights reserved.
//

import UIKit

class JokesViewController: UIViewController {

    var jokes = [Jokes]()
    
    @IBOutlet weak var JokesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        JokesTableView.delegate = self
        JokesTableView.dataSource = self
        loadData()
        print(jokes)
    }
    
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "jokesJSON", ofType: "json") else {
            fatalError("Coudn't find json file")
        }
        print(pathToJSONFile)
        //its a reference to the actual location  of the json file
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try

                Data(contentsOf: url)
            let jokesFromJSON = try
                Jokes.getJoke(from: data)
            jokes = jokesFromJSON!
        } catch {
            print(error)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let jokesDVC = segue.destination as? JokesDetailedViewController else {
            fatalError("Destination not found")
        }
        guard let selectedIndexPath = JokesTableView.indexPathForSelectedRow else {
            fatalError()
        }
        
        jokesDVC.joke = jokes[selectedIndexPath.row]
    }
}

extension JokesViewController: UITableViewDelegate {
    
}

extension JokesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = JokesTableView.dequeueReusableCell(withIdentifier: "jokeCell")
        cell?.textLabel?.text = jokes[indexPath.row].setup
        cell?.textLabel?.numberOfLines = 0
        return cell!
    }
}
