//
//  PGNewGoalViewController.swift
//  mindfull
//
//  Created by Tyler Turek on 8/5/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class PGNewGoalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Instance Variables
    @IBOutlet weak var PGTitle: UITextField!
    @IBOutlet weak var PGReward: UISlider!
    @IBOutlet weak var PGDescription: UITextField!
    @IBOutlet weak var PGTime: UIDatePicker!
    
    //Finish creating new goal - Not Finished
    @IBAction func finishGoal(_ sender: Any) {
        self.performSegue(withIdentifier: "toPGHomeScreen", sender: self)
    }
    
    //Cancel creating new goal - Not Finished
    @IBAction func cancelGoal(_ sender: Any) {
        self.performSegue(withIdentifier: "toPGHomeScreen", sender: self)
    }
}
