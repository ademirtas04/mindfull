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
    
    //Starting - Everytime this view is loaded
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUpScreen()
    }
    
    //Instance Variables
    var thisGoal = personalGoals(title: "", description: "", xpPoints: 0, status: 0, endTime: Date())
    
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var PGTitle: UILabel!
    @IBOutlet weak var PGDescription: UILabel!
    @IBOutlet weak var PGReward: UILabel!
    @IBOutlet weak var PGFinal: UILabel!
    
    //Setting up the screen
    func setUpScreen() {
        PGTitle.text = thisGoal.getTitle()
        PGDescription.text = thisGoal.getDescription()
        PGReward.text = "Goal Reward: +\(String(thisGoal.getxpPoints()))xp"
        timer.text = PGHomeScreenViewController().getTimerLabel(goal: thisGoal)
    }
    
    //Going to PG Home Screen - Not Finished
    @IBAction func toPGHomeScreen(_ sender: Any) {
        self.performSegue(withIdentifier: "toPGHomeScreen", sender: self)
    }
}
