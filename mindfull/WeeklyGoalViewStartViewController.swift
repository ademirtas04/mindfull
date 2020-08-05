//
//  WeeklyGoalViewStartViewController.swift
//  mindfull
//
//  Created by Tyler Turek on 8/4/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class WeeklyGoalViewStartViewController: UIViewController {

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
    
    @IBOutlet weak var WG1Title: UILabel!
    @IBOutlet weak var WG1Description: UILabel!
    @IBOutlet weak var WG1Reward: UILabel!
    
    let calendar = Calendar.current
    
    //Setting up the screen
    func setUpScreen() {
        WG1Title.text = thisGoal.getTitle()
        WG1Description.text = thisGoal.getDescription()
        WG1Reward.text = "Goal Reward: +\(String(thisGoal.getxpPoints()))xp"
        
        let rightNow = Date()
        let nowDay = calendar.dateComponents([.weekday], from: rightNow).weekday!
        let nowHour = calendar.dateComponents([.hour], from: rightNow).hour!
        let nowMinute = calendar.dateComponents([.minute], from: rightNow).minute!
        
        let daysLeft = 7 - nowDay
        var hoursLeft = 24 - nowHour - 1
        var minutesLeft = 60 - nowMinute
        if minutesLeft == 60 {
            hoursLeft = hoursLeft + 1
            minutesLeft = 0
        }
        
        timer.text = "This Weekly Goal will bre Replaced in \(daysLeft) Days \(hoursLeft) Hours \(minutesLeft) minutes"
    }
    
    //Return to DWG Home
    @IBAction func toDWGHomeScreen(_ sender: Any) {
        self.performSegue(withIdentifier: "toDWGHome", sender: self)
    }
}
