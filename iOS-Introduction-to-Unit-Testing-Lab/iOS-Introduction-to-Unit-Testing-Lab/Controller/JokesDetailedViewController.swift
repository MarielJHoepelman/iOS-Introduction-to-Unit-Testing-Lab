//
//  JokesDetailedViewController.swift
//  iOS-Introduction-to-Unit-Testing-Lab
//
//  Created by Mariel Hoepelman on 8/29/19.
//  Copyright © 2019 Mariel Hoepelman. All rights reserved.
//

import UIKit

class JokesDetailedViewController: UIViewController {
    
    var joke: Jokes!
    
    @IBOutlet weak var punchlineLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        punchlineLabel.text = joke.punchline
    }

}
