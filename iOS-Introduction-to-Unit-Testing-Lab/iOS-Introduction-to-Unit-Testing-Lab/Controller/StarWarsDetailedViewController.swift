//
//  StarWarsDetailedViewController.swift
//  iOS-Introduction-to-Unit-Testing-Lab
//
//  Created by Mariel Hoepelman on 8/30/19.
//  Copyright © 2019 Mariel Hoepelman. All rights reserved.
//

import UIKit

class StarWarsDetailedViewController: UIViewController {
    
    var movieSelected: Results!

    @IBOutlet weak var openingCrawlTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        openingCrawlTextView.text = movieSelected.opening_crawl
    }

}
