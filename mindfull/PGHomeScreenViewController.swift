//
//  PGHomeScreenViewController.swift
//  mindfull
//
//  Created by Tyler Turek on 8/3/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class PGHomeScreenViewController: UIViewController {
    //Starting
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Switching to Journey
    @IBAction func toJourney(_ sender: Any) {
        self.performSegue(withIdentifier: "toJourney", sender: self)
    }
    
}
