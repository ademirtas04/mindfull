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
    
    //Starting - Everytime this view is loaded
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUpScreen()
    }
    
    //Instance Variables
    var personalGoals: [personalGoal] = []
    
    var thisGoal = personalGoal(title: "", description: "", xpPoints: 0, status: 0, endTime: Date(), startTime: Date(), finishedTime: Date())
    
    var productivityJournal: [personalGoal] = []
    
    var goalIndex = 10
    
    var goalsDoneToday = 0
    
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var PGTitle: UILabel!
    @IBOutlet weak var PGDescription: UILabel!
    @IBOutlet weak var PGReward: UILabel!
        
    //Setting up the screen
    func setUpScreen() {
        PGTitle.text = thisGoal.getTitle()
        PGDescription.text = thisGoal.getDescription()
        PGReward.text = "Goal Reward: +\(String(thisGoal.getxpPoints()))xp"
        timer.text = PGHomeScreenViewController().getTimerLabel(goal: thisGoal)
    }
    
    //Finishing the goal
    @IBAction func finishGoal(_ sender: Any) {
        thisGoal.changeStatus(newStatus: 4)
        thisGoal.changeFinishedTime(newFinishedTime: Date())
        productivityJournal.append(thisGoal)
    
        XPBar.shared.addProductivityXP(xp: thisGoal.getxpPoints())
        
        self.performSegue(withIdentifier: "toPGHomeScreen", sender: self)
    }
    
    //Discarding the goal
    @IBAction func discardGoal(_ sender: Any) {
        thisGoal.changeStatus(newStatus: 3)
        thisGoal.changeFinishedTime(newFinishedTime: Date())
        self.performSegue(withIdentifier: "toPGHomeScreen", sender: self)
    }
    
    //Going to PG Home Screen
    @IBAction func toPGHomeScreen(_ sender: Any) {
        self.performSegue(withIdentifier: "toPGHomeScreen", sender: self)
    }
    
    //To pass information back to the home screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! PGHomeScreenViewController
        if (goalIndex == 0) {
            personalGoals[0] = thisGoal
        }
        else if (goalIndex == 1) {
            personalGoals[1] = thisGoal
        }
        else if (goalIndex == 2) {
            personalGoals[2] = thisGoal
        }
        vc.personalGoals = personalGoals
        vc.goalsDoneToday = goalsDoneToday
        vc.fromLocalGroup = true
        vc.productivityJournal = productivityJournal
        vc.saveData()
    }
}
