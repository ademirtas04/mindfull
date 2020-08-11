//
//  MyGoalsViewController.swift
//  mindfull
//
//  Created by Tyler Turek on 8/5/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class MyGoalsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func toGarden(_ sender: Any) {
        self.performSegue(withIdentifier: "toGarden", sender: self)
    }
    
    
    @IBAction func toJourney(_ sender: Any) {
        self.performSegue(withIdentifier: "toJourney", sender: self)
    }
    
    
    @IBAction func toDWG(_ sender: Any) {
        self.performSegue(withIdentifier: "toDWG", sender: self)
    }
    
    @IBAction func toPG(_ sender: Any) {
        self.performSegue(withIdentifier: "toPG", sender: self)
    }
}
