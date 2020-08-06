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
    var newPersonalGoal = personalGoals(title: "", description: "", xpPoints: 0, status: 0, endTime: Date())
    
    @IBOutlet weak var PGTitle: UITextField!
    @IBOutlet weak var PGReward: UISlider!
    @IBOutlet weak var PGRewardLabel: UILabel!
    @IBOutlet weak var PGDescription: UITextField!
    @IBOutlet weak var PGTime: UIDatePicker!
    
    //Finish creating new goal - Not Finished
    @IBAction func finishGoal(_ sender: Any) {
        newPersonalGoal.changeTitle(newTitle: PGTitle.text ?? "")
        newPersonalGoal.changeDescription(newDescription: PGDescription.text ?? "")
        
        self.performSegue(withIdentifier: "toPGHomeScreen", sender: self)
    }
    
    //Cancel creating new goal
    @IBAction func cancelGoal(_ sender: Any) {
        self.performSegue(withIdentifier: "toPGHomeScreen", sender: self)
    }
}
