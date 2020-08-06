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
    
    //Starting - Everytime this view is loaded
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateDay()
        setUpScreen()
    }
    
     //Instance Variables
    var personalGoals: [personalGoals] = []
    
    var goalsDoneToday = 0
    
    @IBOutlet weak var goalsLeftCounter: UILabel!
    
    @IBOutlet weak var dayTimer: UILabel!
    
    @IBOutlet weak var PG1Button: UIButton!
    @IBOutlet weak var PG2Button: UIButton!
    @IBOutlet weak var PG3Button: UIButton!
    
    @IBOutlet weak var PG1Title: UILabel!
    @IBOutlet weak var PG2Title: UILabel!
    @IBOutlet weak var PG3Title: UILabel!
    
    @IBOutlet weak var PG1Reward: UILabel!
    @IBOutlet weak var PG2Reward: UILabel!
    @IBOutlet weak var PG3Reward: UILabel!
   
    @IBOutlet weak var PG1Timer: UILabel!
    @IBOutlet weak var PG2Timer: UILabel!
    @IBOutlet weak var PG3Timer: UILabel!
    
    let calendar = Calendar.current
    
    var previousDayDate = Date()
    
    //Setting up the screen
    func setUpScreen() {
        let size = personalGoals.count
        if (size >= 1) {
            PG1Title.text = personalGoals[0].getTitle()
            PG1Reward.text  = "+\(String(personalGoals[0].getxpPoints()))xp"
            PG1Timer.text = getTimerLabel(goal: personalGoals[2])
            
            if (personalGoals[0].getStatus() == 1) {
                PG1Button.backgroundColor = UIColor.lightGray
            }
            else if (personalGoals[0].getStatus() == 2) {
                PG1Button.backgroundColor = UIColor.yellow
            }
            else if (personalGoals[0].getStatus() == 3) {
                PG1Button.backgroundColor = UIColor.red
            }
            else if (personalGoals[0].getStatus() == 4) {
                PG1Button.backgroundColor = UIColor.green
            }
        }
        if (size >= 2) {
            PG2Title.text = personalGoals[1].getTitle()
            PG2Reward.text  = "+\(String(personalGoals[1].getxpPoints()))xp"
            PG2Timer.text = getTimerLabel(goal: personalGoals[2])
            
            if (personalGoals[1].getStatus() == 1) {
                PG2Button.backgroundColor = UIColor.lightGray
            }
            else if (personalGoals[1].getStatus() == 2) {
                PG2Button.backgroundColor = UIColor.yellow
            }
            else if (personalGoals[1].getStatus() == 3) {
                PG2Button.backgroundColor = UIColor.red
            }
            else if (personalGoals[1].getStatus() == 4) {
                PG2Button.backgroundColor = UIColor.green
            }
        }
        if (size == 3) {
            PG3Title.text = personalGoals[2].getTitle()
            PG3Reward.text  = "+\(String(personalGoals[2].getxpPoints()))xp"
            PG3Timer.text = getTimerLabel(goal: personalGoals[2])
            
            if (personalGoals[2].getStatus() == 1) {
                PG3Button.backgroundColor = UIColor.lightGray
            }
            else if (personalGoals[2].getStatus() == 2) {
                PG3Button.backgroundColor = UIColor.yellow
            }
            else if (personalGoals[2].getStatus() == 3) {
                PG3Button.backgroundColor = UIColor.red
            }
            else if (personalGoals[2].getStatus() == 4) {
                PG3Button.backgroundColor = UIColor.green
            }
        }
        
        goalsLeftCounter.text = String(6 - goalsDoneToday)
        
        let rightNow = Date()
        let nowHour = calendar.dateComponents([.hour], from: rightNow).hour!
        let nowMinute = calendar.dateComponents([.minute], from: rightNow).minute!
        
        var hoursLeft = 24 - nowHour - 1
        var minutesLeft = 60 - nowMinute
        if minutesLeft == 60 {
            hoursLeft = hoursLeft + 1
            minutesLeft = 0
        }
        dayTimer.text = "Day Ends in \(hoursLeft) Hours \(minutesLeft) Minutes"
    }
    
    func getTimerLabel(goal: personalGoals) -> String {
        let rightNow = Date()
        let endTime = goal.getEndTime()
        
        let rightNowWeek = calendar.dateComponents([.weekOfYear], from: rightNow).weekOfYear!
        let rightNowDay = calendar.dateComponents([.weekday], from: rightNow).weekday!
        let rightNowHour = calendar.dateComponents([.hour], from: rightNow).hour!
        let rightNowMinute = calendar.dateComponents([.minute], from: rightNow).minute!
        
        let endWeek = calendar.dateComponents([.weekOfYear], from: endTime).weekOfYear!
        let endDay = calendar.dateComponents([.weekday], from: endTime).weekday!
        let endHour = calendar.dateComponents([.hour], from: endTime).hour!
        let endMinute = calendar.dateComponents([.minute], from: endTime).minute!
        
        var daysLeft = endDay - rightNowDay
        var hoursLeft = endHour - rightNowHour
        var minutesLeft = endMinute - rightNowMinute
        
        if rightNowWeek != endWeek {
            let weeksLeft = endWeek - rightNowWeek
            daysLeft = daysLeft + weeksLeft*7
        }
        
        if hoursLeft < 0 {
            daysLeft = daysLeft - 1
            hoursLeft = 24 - hoursLeft
        }
        if minutesLeft < 0 {
            hoursLeft = hoursLeft - 1
            minutesLeft = 60 - minutesLeft
        }
        return "This Goal Ends in \(daysLeft) Days \(hoursLeft) Hours \(minutesLeft) Minutes"
    }
    
    //Updates the goals done today counter if a day has passed
    func updateDay() {
        let rightNow = Date()
        let rightNowWeekDay = calendar.dateComponents([.weekday], from: rightNow)
        let previousWeekDay = calendar.dateComponents([.weekday], from: previousDayDate)
        if (rightNowWeekDay != previousWeekDay) {
            previousDayDate = rightNow
            goalsDoneToday = 0
        }
        else {
            let rightNowWeek = calendar.dateComponents([.weekOfYear], from: rightNow)
            let previousWeek = calendar.dateComponents([.weekOfYear], from: previousDayDate)
            if (rightNowWeek != previousWeek)  {
                previousDayDate = rightNow
                goalsDoneToday = 0
            }
        }
        previousDayDate = rightNow
    }
    
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

//Personal Goal class
class personalGoals: Goal {
    var endTime = Date()
    
    init(title: String, description: String, xpPoints: Int, status: Int, endTime: Date) {
        super.init(title: title, description: description, xpPoints: xpPoints, status: status)
        self.endTime = endTime
    }
    
    func getEndTime() -> Date {
        return endTime
    }
    
    func changeEndTime(newEndTime: Date) {
        self.endTime = newEndTime
    }
}
