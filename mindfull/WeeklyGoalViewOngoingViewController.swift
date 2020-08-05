//
//  WeeklyGoalViewOngoingViewController.swift
//  mindfull
//
//  Created by Tyler Turek on 8/4/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class WeeklyGoalViewOngoingViewController: UIViewController {

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
    
    var goalIndex = 10
    
    var dailyGoals: [Goal] = []
    
    var allDailyGoals: [Goal] = []
    
    var weeklyGoals: [Goal] = []
    
    var allWeeklyGoals: [Goal] = []
    
    @IBOutlet weak var timer: UILabel!
    
    @IBOutlet weak var WG2Title: UILabel!
    @IBOutlet weak var WG2Description: UILabel!
    @IBOutlet weak var WG2Reward: UILabel!
    
    let calendar = Calendar.current
    
    //Setting up the screen
    func setUpScreen() {
        WG2Title.text = thisGoal.getTitle()
        WG2Description.text = thisGoal.getDescription()
        WG2Reward.text = "Goal Reward: +\(String(thisGoal.getxpPoints()))xp"
        
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
        
        timer.text = "This Weekly Goal Ends in \(daysLeft) Days \(hoursLeft) Hours \(minutesLeft) minutes"
    }
    
    //Finishing the goal
    @IBAction func finishGoal(_ sender: Any) {
        thisGoal.changeStatus(newStatus: 4)
        self.performSegue(withIdentifier: "toDWGHome", sender: self)
    }
    
    //Discarding the goal
    @IBAction func discardGoal(_ sender: Any) {
        thisGoal.changeStatus(newStatus: 3)
        self.performSegue(withIdentifier: "toDWGHome", sender: self)
    }
    
    //Return to DWG Home
    @IBAction func toDWGHomeScreen(_ sender: Any) {
        self.performSegue(withIdentifier: "toDWGHome", sender: self)
    }
    
    //To pass information back to the home screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DWGHomeScreenViewController
        if (goalIndex == 0) {
            dailyGoals[0] = thisGoal
        }
        else if (goalIndex == 1) {
            dailyGoals[1] = thisGoal
        }
        else if (goalIndex == 2) {
            dailyGoals[2] = thisGoal
        }
        else if (goalIndex == 3) {
            weeklyGoals[0] = thisGoal
        }
        else if (goalIndex == 4) {
            weeklyGoals[1] = thisGoal
        }
        else if (goalIndex == 5) {
            weeklyGoals[2] = thisGoal
        }
        vc.currentDailyGoals = dailyGoals
        vc.currentWeeklyGoals = weeklyGoals
        vc.dailyGoals = allDailyGoals
        vc.weeklyGoals = allWeeklyGoals
    }
}
