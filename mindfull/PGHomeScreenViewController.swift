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
    
     //Instance Variables
    @IBOutlet weak var goalsLeftCounter: UILabel!
    
    @IBOutlet weak var dayTimer: UILabel!
    
    @IBOutlet weak var PG1Title: UILabel!
    @IBOutlet weak var PG2Title: UILabel!
    @IBOutlet weak var PG3Title: UILabel!
    
    @IBOutlet weak var PG1Reward: UILabel!
    @IBOutlet weak var PG2Reward: UILabel!
    @IBOutlet weak var PG3Reward: UILabel!
   
    @IBOutlet weak var PG1Timer: UILabel!
    @IBOutlet weak var PG2Timer: UILabel!
    @IBOutlet weak var PG3Timer: UILabel!
    
    
    //Switching to My Goals Home Screen - Not Finished
    @IBAction func toMyGoals(_ sender: Any) {
        self.performSegue(withIdentifier: "toMyGoals", sender: self)
    }
    
    //Switching to New Goal - Not Finished
    @IBAction func toNewGoal(_ sender: Any) {
        self.performSegue(withIdentifier: "toPGNewGoal", sender: self)
    }
    
    //Switching to Personal Goal View
    @IBAction func toPG1(_ sender: Any) {
        self.performSegue(withIdentifier: "toPGGoalViewOngoing", sender: self)
    }
    
    @IBAction func toPG2(_ sender: Any) {
        self.performSegue(withIdentifier: "toPGGoalViewOngoing", sender: self)
    }
    
    @IBAction func toPG3(_ sender: Any) {
        self.performSegue(withIdentifier: "toPGGoalViewOngoing", sender: self)
    }
}
