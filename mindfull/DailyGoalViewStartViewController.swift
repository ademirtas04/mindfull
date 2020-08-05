//
//  DailyGoalViewStartViewController.swift
//  mindfull
//
//  Created by Tyler Turek on 8/4/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class DailyGoalViewStartViewController: UIViewController {

    //Starting - Only first ever time this is loaded
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
    var thisGoal = Goal(title: "", description: "", xpPoints: 0, status: 0)
    
    @IBOutlet weak var timer: UILabel!
    
    @IBOutlet weak var DG1Title: UILabel!
    @IBOutlet weak var DG1Description: UILabel!
    @IBOutlet weak var DG1Reward: UILabel!
    
    let calendar = Calendar.current
    
    //Setting up the screen
    func setUpScreen() {
        DG1Title.text = thisGoal.getTitle()
        DG1Description.text = thisGoal.getDescription()
        DG1Reward.text = "Goal Reward: +\(String(thisGoal.getxpPoints()))xp"
        
        let rightNow = Date()
        let nowHour = calendar.dateComponents([.hour], from: rightNow).hour!
        let nowMinute = calendar.dateComponents([.minute], from: rightNow).minute!
        
        var hoursLeft = 24 - nowHour - 1
        var minutesLeft = 60 - nowMinute
        if minutesLeft == 60 {
            hoursLeft = hoursLeft + 1
            minutesLeft = 0
        }
        
        timer.text = "This Daily Goal Will be Replaced in \(hoursLeft) Hours \(minutesLeft) Minutes"
    }
    
    //Return to DWG Home
    @IBAction func toDWGHomeScreen(_ sender: Any) {
        self.performSegue(withIdentifier: "toDWGHome", sender: self)
    }
}
