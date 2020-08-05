//
//  PGGoalViewFinishViewController.swift
//  mindfull
//
//  Created by Tyler Turek on 8/5/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class PGGoalViewFinishViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Instance Variables
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var PGTitle: UILabel!
    @IBOutlet weak var PGDescription: UILabel!
    @IBOutlet weak var PGReward: UILabel!
    @IBOutlet weak var PGFinal: UILabel!
    
    //Going to PG Home Screen - Not Finished
    @IBAction func toPGHomeScreen(_ sender: Any) {
        self.performSegue(withIdentifier: "toPGHomeScreen", sender: self)
    }
}
