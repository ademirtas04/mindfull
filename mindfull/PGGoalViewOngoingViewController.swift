//
//  PGGoalViewOngoingViewController.swift
//  mindfull
//
//  Created by Tyler Turek on 8/5/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class PGGoalViewOngoingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Instance Variables
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var PGTitle: UILabel!
    @IBOutlet weak var PGDescription: UILabel!
    @IBOutlet weak var PGReward: UILabel!
    
    //Finishing the goal - Not Finished
    @IBAction func finishGoal(_ sender: Any) {
        self.performSegue(withIdentifier: "toPGHomeScreen", sender: self)
    }
    
    //Discarding the goal
    @IBAction func discardGoal(_ sender: Any) {
        self.performSegue(withIdentifier: "toPGHomeScreen", sender: self)
    }
    
    //Going to PG Home Screen
    @IBAction func toPGHomeScreen(_ sender: Any) {
        self.performSegue(withIdentifier: "toPGHomeScreen", sender: self)
    }
}
