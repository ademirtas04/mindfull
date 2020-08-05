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
    
    
    @IBAction func toDWG(_ sender: Any) {
        self.performSegue(withIdentifier: "toDWG", sender: self)
    }
    
    @IBAction func toPG(_ sender: Any) {
        self.performSegue(withIdentifier: "toPG", sender: self)
    }
}
