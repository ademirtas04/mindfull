//
//  DWGHomeScreenViewController.swift
//  mindfull
//
//  Created by Tyler Turek on 8/3/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class DWGHomeScreenViewController: UIViewController {
    
    //Starting - Only first ever time this is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (dailyGoals.count == 0) {
            initGoals()
        }
    }
    
    //Starting - Everytime this view is loaded
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getData()
        
        if (checkDay()) {
            chooseDailyGoals()
        }
        if (checkWeek()) {
            chooseWeeklyGoals()
        }
        setUpScreen()
    }
    
    //Instance Variables
    var dailyGoals: [Goal] = []
    var currentDailyGoals: [Goal] = []
    
    var weeklyGoals: [Goal] = []
    var currentWeeklyGoals: [Goal] = []
    
    var selectedGoal = Goal(title: "", description: "", xpPoints: 0, status: 0)
    
    //This variable is to show which goal view will be switched to, with 0 for daily start, 1 for daily ongoing, 2 for daily finished, 3 for weekly start, 4 for weekly ongoing and 5 for weekly finished and set to 10 as default
    var indexOfMove = 10
    
    //This variable specifies which goal was passed to goal view, with 0 for daily goal 1, 1 for daily goal 2, 2 for daily goal 3, 3 for weekly goal 1, 4 for weekly goal 2 and 5 for weekly goal 5 and set to 10 as default
    var indexOfGoal = 10
        
    @IBOutlet weak var DG1Title: UILabel!
    @IBOutlet weak var DG2Title: UILabel!
    @IBOutlet weak var DG3Title: UILabel!
    
    @IBOutlet weak var DG1xp: UILabel!
    @IBOutlet weak var DG2xp: UILabel!
    @IBOutlet weak var DG3xp: UILabel!
    
    @IBOutlet weak var WG1Title: UILabel!
    @IBOutlet weak var WG2Title: UILabel!
    @IBOutlet weak var WG3Title: UILabel!
    
    @IBOutlet weak var WG1xp: UILabel!
    @IBOutlet weak var WG2xp: UILabel!
    @IBOutlet weak var WG3xp: UILabel!
    
    @IBOutlet weak var DG1Button: UIButton!
    @IBOutlet weak var DG2Button: UIButton!
    @IBOutlet weak var DG3Button: UIButton!
    
    @IBOutlet weak var WG1Button: UIButton!
    @IBOutlet weak var WG2Button: UIButton!
    @IBOutlet weak var WG3Button: UIButton!
    
    @IBOutlet weak var DGTimeLeft: UILabel!
    @IBOutlet weak var WGTimeLeft: UILabel!
    
    let calendar = Calendar.current
    
    var previousDayDate = Date()
    
    
    //Initializing the goals
    func initGoals() {
        //Daily Goals
        //The meditation goals
        let DGMGoal1 = Goal(title: "TitleM", description: "Description", xpPoints: 10, status: 0)
        DGMGoal1.changeTypeOfGoal(newTypeOfGoal: 1)
        let DGMGoal2 = Goal(title: "TitleM", description: "Description", xpPoints: 10, status: 0)
        DGMGoal2.changeTypeOfGoal(newTypeOfGoal: 1)
        let DGMGoal3 = Goal(title: "TitleM", description: "Description", xpPoints: 10, status: 0)
        DGMGoal3.changeTypeOfGoal(newTypeOfGoal: 1)
        let DGMGoal4 = Goal(title: "TitleM", description: "Description", xpPoints: 10, status: 0)
        DGMGoal4.changeTypeOfGoal(newTypeOfGoal: 1)
        let DGMGoal5 = Goal(title: "TitleM", description: "Description", xpPoints: 10, status: 0)
        DGMGoal5.changeTypeOfGoal(newTypeOfGoal: 1)
        let DGMGoal6 = Goal(title: "titleM", description: "Description", xpPoints: 10, status: 0)
        DGMGoal6.changeTypeOfGoal(newTypeOfGoal: 1)
        dailyGoals.append(contentsOf: [DGMGoal1, DGMGoal2, DGMGoal3, DGMGoal4, DGMGoal5, DGMGoal6])
        
        //The ongoing goals
        let DGOGoal1 = Goal(title: "TitleO", description: "Description", xpPoints: 10, status: 0)
        DGOGoal1.changeTypeOfGoal(newTypeOfGoal: 2)
        let DGOGoal2 = Goal(title: "TitleO", description: "Description", xpPoints: 10, status: 0)
        DGOGoal2.changeTypeOfGoal(newTypeOfGoal: 2)
        let DGOGoal3 = Goal(title: "TitleO", description: "Description", xpPoints: 10, status: 0)
        DGOGoal3.changeTypeOfGoal(newTypeOfGoal: 2)
        let DGOGoal4 = Goal(title: "TitleO", description: "Description", xpPoints: 10, status: 0)
        DGOGoal4.changeTypeOfGoal(newTypeOfGoal: 2)
        let DGOGoal5 = Goal(title: "TitleO", description: "Description", xpPoints: 10, status: 0)
        DGOGoal5.changeTypeOfGoal(newTypeOfGoal: 2)
        let DGOGoal6 = Goal(title: "titleO", description: "Description", xpPoints: 10, status: 0)
        DGOGoal6.changeTypeOfGoal(newTypeOfGoal: 2)
        dailyGoals.append(contentsOf: [DGOGoal1, DGOGoal2, DGOGoal3, DGOGoal4, DGOGoal5, DGOGoal6])
        
        //The productivity goals
        let DGPGoal1 = Goal(title: "TitleP", description: "Description", xpPoints: 10, status: 0)
        DGPGoal1.changeTypeOfGoal(newTypeOfGoal: 3)
        let DGPGoal2 = Goal(title: "TitleP", description: "Description", xpPoints: 10, status: 0)
        DGPGoal2.changeTypeOfGoal(newTypeOfGoal: 3)
        let DGPGoal3 = Goal(title: "TitleP", description: "Description", xpPoints: 10, status: 0)
        DGPGoal3.changeTypeOfGoal(newTypeOfGoal: 3)
        let DGPGoal4 = Goal(title: "TitleP", description: "Description", xpPoints: 10, status: 0)
        DGPGoal4.changeTypeOfGoal(newTypeOfGoal: 3)
        let DGPGoal5 = Goal(title: "TitleP", description: "Description", xpPoints: 10, status: 0)
        DGPGoal5.changeTypeOfGoal(newTypeOfGoal: 3)
        let DGPGoal6 = Goal(title: "titleP", description: "Description", xpPoints: 10, status: 0)
        DGPGoal6.changeTypeOfGoal(newTypeOfGoal: 3)
        dailyGoals.append(contentsOf: [DGPGoal1, DGPGoal2, DGPGoal3, DGPGoal4, DGPGoal5, DGPGoal6])
        
        //The enviormental interaction goals
        let DGEIGoal1 = Goal(title: "TitleEI", description: "Description", xpPoints: 10, status: 0)
        DGEIGoal1.changeTypeOfGoal(newTypeOfGoal: 4)
        let DGEIGoal2 = Goal(title: "TitleEI", description: "Description", xpPoints: 10, status: 0)
        DGEIGoal2.changeTypeOfGoal(newTypeOfGoal: 4)
        let DGEIGoal3 = Goal(title: "TitleEI", description: "Description", xpPoints: 10, status: 0)
        DGEIGoal3.changeTypeOfGoal(newTypeOfGoal: 4)
        let DGEIGoal4 = Goal(title: "TitleEI", description: "Description", xpPoints: 10, status: 0)
        DGEIGoal4.changeTypeOfGoal(newTypeOfGoal: 4)
        let DGEIGoal5 = Goal(title: "TitleEI", description: "Description", xpPoints: 10, status: 0)
        DGEIGoal5.changeTypeOfGoal(newTypeOfGoal: 4)
        let DGEIGoal6 = Goal(title: "TitleEI", description: "Description", xpPoints: 10, status: 0)
        DGEIGoal6.changeTypeOfGoal(newTypeOfGoal: 4)
        dailyGoals.append(contentsOf: [DGEIGoal1, DGEIGoal2, DGEIGoal3, DGEIGoal4, DGEIGoal5, DGEIGoal6])
        
        //The self-assesment goals
        let DGSGoal1 = Goal(title: "TitleS", description: "Description", xpPoints: 10, status: 0)
        DGSGoal1.changeTypeOfGoal(newTypeOfGoal: 5)
        let DGSGoal2 = Goal(title: "TitleS", description: "Description", xpPoints: 10, status: 0)
        DGSGoal2.changeTypeOfGoal(newTypeOfGoal: 5)
        let DGSGoal3 = Goal(title: "TitleS", description: "Description", xpPoints: 10, status: 0)
        DGSGoal3.changeTypeOfGoal(newTypeOfGoal: 5)
        let DGSGoal4 = Goal(title: "TitleS", description: "Description", xpPoints: 10, status: 0)
        DGSGoal4.changeTypeOfGoal(newTypeOfGoal: 5)
        let DGSGoal5 = Goal(title: "TitleS", description: "Description", xpPoints: 10, status: 0)
        DGSGoal5.changeTypeOfGoal(newTypeOfGoal: 5)
        let DGSGoal6 = Goal(title: "TitleS", description: "Description", xpPoints: 10, status: 0)
        DGSGoal6.changeTypeOfGoal(newTypeOfGoal: 5)
        dailyGoals.append(contentsOf: [DGSGoal1, DGSGoal2, DGSGoal3, DGSGoal4, DGSGoal5, DGSGoal6])
        
        //Weekly Goals
        //The meditation goals
        let WGMGoal1 = Goal(title: "TitleM", description: "Description", xpPoints: 10, status: 0)
        WGMGoal1.changeTypeOfGoal(newTypeOfGoal: 1)
        let WGMGoal2 = Goal(title: "TitleM", description: "Description", xpPoints: 10, status: 0)
        WGMGoal2.changeTypeOfGoal(newTypeOfGoal: 1)
        let WGMGoal3 = Goal(title: "TitleM", description: "Description", xpPoints: 10, status: 0)
        WGMGoal3.changeTypeOfGoal(newTypeOfGoal: 1)
        weeklyGoals.append(contentsOf: [WGMGoal1, WGMGoal2, WGMGoal3])
        
        //The ongoing goals
        let WGOGoal1 = Goal(title: "TitleO", description: "Description", xpPoints: 10, status: 0)
        WGOGoal1.changeTypeOfGoal(newTypeOfGoal: 2)
        let WGOGoal2 = Goal(title: "TitleO", description: "Description", xpPoints: 10, status: 0)
        WGOGoal2.changeTypeOfGoal(newTypeOfGoal: 2)
        let WGOGoal3 = Goal(title: "TitleO", description: "Description", xpPoints: 10, status: 0)
        WGOGoal3.changeTypeOfGoal(newTypeOfGoal: 2)
        weeklyGoals.append(contentsOf: [WGOGoal1, WGOGoal2, WGOGoal3])
        
        //The productivity goals
        let WGPGoal1 = Goal(title: "TitleP", description: "Description", xpPoints: 10, status: 0)
        WGPGoal1.changeTypeOfGoal(newTypeOfGoal: 3)
        let WGPGoal2 = Goal(title: "TitleP", description: "Description", xpPoints: 10, status: 0)
        WGPGoal2.changeTypeOfGoal(newTypeOfGoal: 3)
        let WGPGoal3 = Goal(title: "TitleP", description: "Description", xpPoints: 10, status: 0)
        WGPGoal3.changeTypeOfGoal(newTypeOfGoal: 3)
        weeklyGoals.append(contentsOf: [WGPGoal1, WGPGoal2, WGPGoal3])
        
        //The enviormental interaction goals
        let WGEIGoal1 = Goal(title: "TitleEI", description: "Description", xpPoints: 10, status: 0)
        WGEIGoal1.changeTypeOfGoal(newTypeOfGoal: 4)
        let WGEIGoal2 = Goal(title: "TitleEI", description: "Description", xpPoints: 10, status: 0)
        WGEIGoal2.changeTypeOfGoal(newTypeOfGoal: 4)
        let WGEIGoal3 = Goal(title: "TitleEI", description: "Description", xpPoints: 10, status: 0)
        WGEIGoal3.changeTypeOfGoal(newTypeOfGoal: 4)
        weeklyGoals.append(contentsOf: [WGEIGoal1, WGEIGoal2, WGEIGoal3])
        
        //The self-assesment goals
        let WGSGoal1 = Goal(title: "TitleS", description: "Description", xpPoints: 10, status: 0)
        WGSGoal1.changeTypeOfGoal(newTypeOfGoal: 5)
        let WGSGoal2 = Goal(title: "TitleS", description: "Description", xpPoints: 10, status: 0)
        WGSGoal2.changeTypeOfGoal(newTypeOfGoal: 5)
        let WGSGoal3 = Goal(title: "TitleS", description: "Description", xpPoints: 10, status: 0)
        WGSGoal3.changeTypeOfGoal(newTypeOfGoal: 5)
        weeklyGoals.append(contentsOf: [WGSGoal1, WGSGoal2, WGSGoal3])
        
        chooseDailyGoals()
        chooseWeeklyGoals()
    }
    
    //Choosing the daily goals
    func chooseDailyGoals() {
        currentDailyGoals.removeAll()
        
        //We get a random integer from 1-30 then subtract 1 since arrays start at 0, meaning that the last element (goal 30) has an index of 29
        let random1 = Int.random(in: 1..<31) - 1
        let random2 = Int.random(in: 1..<31) - 1
        let random3 = Int.random(in: 1..<31) - 1
        
        let dailyGoal1 = dailyGoals[random1]
        let dailyGoal2 = dailyGoals[random2]
        let dailyGoal3 = dailyGoals[random3]
        
        dailyGoal1.changeStatus(newStatus: 1)
        dailyGoal2.changeStatus(newStatus: 1)
        dailyGoal3.changeStatus(newStatus: 1)

        currentDailyGoals.append(dailyGoal1)
        currentDailyGoals.append(dailyGoal2)
        currentDailyGoals.append(dailyGoal3)
    }
    
    //Choosing the weekly goals
    func chooseWeeklyGoals() {
        currentWeeklyGoals.removeAll()
        
        //We get a random integer from 1-15 then subtract 1 since arrays start at 0, meaning that the last element (goal 15) has an index of 14
        let random1 = Int.random(in: 1..<16) - 1
        let random2 = Int.random(in: 1..<16) - 1
        let random3 = Int.random(in: 1..<16) - 1
        
        let weeklyGoal1 = weeklyGoals[random1]
        let weeklyGoal2 = weeklyGoals[random2]
        let weeklyGoal3 = weeklyGoals[random3]
        
        
        weeklyGoal1.changeStatus(newStatus: 1)
        weeklyGoal2.changeStatus(newStatus: 1)
        weeklyGoal3.changeStatus(newStatus: 1)
        
        currentWeeklyGoals.append(weeklyGoal1)
        currentWeeklyGoals.append(weeklyGoal2)
        currentWeeklyGoals.append(weeklyGoal3)
    }
    
    //Setup the buttons and labels
    func setUpScreen() {
        DG1Title.text = currentDailyGoals[0].getTitle()
        DG1xp.text = "+\(String(currentDailyGoals[0].getxpPoints()))xp"
        if (currentDailyGoals[0].getStatus() == 1) {
            DG1Title.textColor = UIColor.white
            DG1xp.textColor = UIColor.white
            DG1Button.backgroundColor = UIColor.darkGray
        }
        else if (currentDailyGoals[0].getStatus() == 2) {
            DG1Button.backgroundColor = UIColor.yellow
        }
        else if (currentDailyGoals[0].getStatus() == 3) {
            DG1Button.backgroundColor = UIColor.red
        }
        else if (currentDailyGoals[0].getStatus() == 4) {
            DG1Button.backgroundColor = UIColor.green
        }
        
        DG2Title.text = currentDailyGoals[1].getTitle()
        DG2xp.text = "+\(String(currentDailyGoals[1].getxpPoints()))xp"
        if (currentDailyGoals[1].getStatus() == 1) {
            DG2Title.textColor = UIColor.white
            DG2xp.textColor = UIColor.white
            DG2Button.backgroundColor = UIColor.darkGray
        }
        else if (currentDailyGoals[1].getStatus() == 2) {
            DG2Button.backgroundColor = UIColor.yellow
        }
        else if (currentDailyGoals[1].getStatus() == 3) {
            DG2Button.backgroundColor = UIColor.red
        }
        else if (currentDailyGoals[1].getStatus() == 4) {
            DG2Button.backgroundColor = UIColor.green
        }
        
        DG3Title.text = currentDailyGoals[2].getTitle()
        DG3xp.text = "+\(String(currentDailyGoals[2].getxpPoints()))xp"
        if (currentDailyGoals[2].getStatus() == 1) {
            DG3Title.textColor = UIColor.white
            DG3xp.textColor = UIColor.white
            DG3Button.backgroundColor = UIColor.darkGray
        }
        else if (currentDailyGoals[2].getStatus() == 2) {
            DG3Button.backgroundColor = UIColor.yellow
        }
        else if (currentDailyGoals[2].getStatus() == 3) {
            DG3Button.backgroundColor = UIColor.red
        }
        else if (currentDailyGoals[2].getStatus() == 4) {
            DG3Button.backgroundColor = UIColor.green
        }
        
        WG1Title.text = currentWeeklyGoals[0].getTitle()
        WG1xp.text = "+\(String(currentWeeklyGoals[0].getxpPoints()))xp"
        if (currentWeeklyGoals[0].getStatus() == 1) {
            WG1Title.textColor = UIColor.white
            WG1xp.textColor = UIColor.white
            WG1Button.backgroundColor = UIColor.darkGray
        }
        else if (currentWeeklyGoals[0].getStatus() == 2) {
            WG1Button.backgroundColor = UIColor.yellow
        }
        else if (currentWeeklyGoals[0].getStatus() == 3) {
            WG1Button.backgroundColor = UIColor.red
        }
        else if (currentWeeklyGoals[0].getStatus() == 4) {
            WG1Button.backgroundColor = UIColor.green
        }
        
        WG2Title.text = currentWeeklyGoals[1].getTitle()
        WG2xp.text = "+\(String(currentWeeklyGoals[1].getxpPoints()))xp"
        if (currentWeeklyGoals[1].getStatus() == 1) {
            WG2Title.textColor = UIColor.white
            WG2xp.textColor = UIColor.white
            WG2Button.backgroundColor = UIColor.darkGray
        }
        else if (currentWeeklyGoals[1].getStatus() == 2) {
            WG2Button.backgroundColor = UIColor.yellow
        }
        else if (currentWeeklyGoals[1].getStatus() == 3) {
            WG2Button.backgroundColor = UIColor.red
        }
        else if (currentWeeklyGoals[1].getStatus() == 4) {
            WG2Button.backgroundColor = UIColor.green
        }
        
        WG3Title.text = currentWeeklyGoals[2].getTitle()
        WG3xp.text = "+\(String(currentWeeklyGoals[2].getxpPoints()))xp"
        if (currentWeeklyGoals[2].getStatus() == 1) {
            WG3Title.textColor = UIColor.white
            WG3xp.textColor = UIColor.white
            WG3Button.backgroundColor = UIColor.darkGray
        }
        else if (currentWeeklyGoals[2].getStatus() == 2) {
            WG3Button.backgroundColor = UIColor.yellow
        }
        else if (currentWeeklyGoals[2].getStatus() == 3) {
            WG3Button.backgroundColor = UIColor.red
        }
        else if (currentWeeklyGoals[2].getStatus() == 4) {
            WG3Button.backgroundColor = UIColor.green
        }
        
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
        
        DGTimeLeft.text = "Daily Goals Change in \(hoursLeft) Hours \(minutesLeft) Minutes"
        WGTimeLeft.text = "Weekly Goals Change in \(daysLeft) Days \(hoursLeft) Hours \(minutesLeft) minutes"
    }
    
    //Determine whether or not a day has past and if new daily goals are needed
    func checkDay() -> Bool {
        let rightNow = Date()
        let rightNowWeekDay = calendar.dateComponents([.weekday], from: rightNow)
        let previousWeekDay = calendar.dateComponents([.weekday], from: previousDayDate)
        if (rightNowWeekDay != previousWeekDay) {
            previousDayDate = rightNow
            return true
        }
        else {
            let rightNowWeek = calendar.dateComponents([.weekOfYear], from: rightNow)
            let previousWeek = calendar.dateComponents([.weekOfYear], from: previousDayDate)
            if (rightNowWeek != previousWeek)  {
                previousDayDate = rightNow
                return true
            }
        }
        previousDayDate = rightNow
        return false
    }

    //Determine whether or not a week has past and if new weekly goals are needed
    func checkWeek() -> Bool {
        let rightNow = Date()
        let rightNowWeek = calendar.dateComponents([.weekOfYear], from: rightNow)
        let previousWeek = calendar.dateComponents([.weekOfYear], from: previousDayDate)
        if (rightNowWeek != previousWeek) {
            previousDayDate = rightNow
            return true
        }
        previousDayDate = rightNow
        return false
    }
    
    //Back to My Goals Home Scree
    @IBAction func toMyGoals(_ sender: Any) {
        indexOfGoal = 10
        indexOfMove = 10
        self.performSegue(withIdentifier: "toMyGoals", sender: self)
    }
    
    //Switching to Goal View (Daily)
    @IBAction func toGoalViewDG1(_ sender: Any) {
        indexOfGoal = 0
        selectedGoal = currentDailyGoals[0]
        let index = currentDailyGoals[0].getStatus()
        
        if (index == 1) {
            indexOfMove = 0
            self.performSegue(withIdentifier: "toDailyGoalViewStart", sender: self)
        }
        else if (index == 2) {
            indexOfMove = 1
            self.performSegue(withIdentifier: "toDailyGoalViewOngoing", sender: self)
        }
        else if (index == 3 || index == 4) {
            indexOfMove = 2
            self.performSegue(withIdentifier: "toDailyGoalViewFinish", sender: self)
        }
    }
    
    @IBAction func toGoalViewDG2(_ sender: Any) {
        indexOfGoal = 1
        selectedGoal = currentDailyGoals[1]
        let index = currentDailyGoals[1].getStatus()
        
        if (index == 1) {
            indexOfMove = 0
            self.performSegue(withIdentifier: "toDailyGoalViewStart", sender: self)
        }
        else if (index == 2) {
            indexOfMove = 1
            self.performSegue(withIdentifier: "toDailyGoalViewOngoing", sender: self)
        }
        else if (index == 3 || index == 4) {
            indexOfMove = 2
            self.performSegue(withIdentifier: "toDailyGoalViewFinish", sender: self)
        }
    }
    
    @IBAction func toGoalViewDG3(_ sender: Any) {
        indexOfGoal = 2
        selectedGoal = currentDailyGoals[2]
        let index = currentDailyGoals[2].getStatus()
        
        if (index == 1) {
            indexOfMove = 0
            self.performSegue(withIdentifier: "toDailyGoalViewStart", sender: self)
        }
        else if (index == 2) {
            indexOfMove = 1
            self.performSegue(withIdentifier: "toDailyGoalViewOngoing", sender: self)
        }
        else if (index == 3 || index == 4) {
            indexOfMove = 2
            self.performSegue(withIdentifier: "toDailyGoalViewFinish", sender: self)
        }
    }
    
    //Switching to Goal View (Weekly)
    @IBAction func toGoalViewWG1(_ sender: Any) {
        indexOfGoal = 3
        selectedGoal = currentWeeklyGoals[0]
        let index = currentWeeklyGoals[0].getStatus()
        
        if (index == 1) {
            indexOfMove = 3
            self.performSegue(withIdentifier: "toWeeklyGoalViewStart", sender: self)
        }
        else if (index == 2) {
            indexOfMove = 4
            self.performSegue(withIdentifier: "toWeeklyGoalViewOngoing", sender: self)
        }
        else if (index == 3 || index == 4) {
            indexOfMove = 5
            self.performSegue(withIdentifier: "toWeeklyGoalViewFinish", sender: self)
        }
    }
    
    @IBAction func toGoalViewWG2(_ sender: Any) {
        indexOfGoal = 4
        selectedGoal = currentWeeklyGoals[1]
        let index = currentWeeklyGoals[1].getStatus()
        
        if (index == 1) {
            indexOfMove = 3
            self.performSegue(withIdentifier: "toWeeklyGoalViewStart", sender: self)
        }
        else if (index == 2) {
            indexOfMove = 4
            self.performSegue(withIdentifier: "toWeeklyGoalViewOngoing", sender: self)
        }
        else if (index == 3 || index == 4) {
            indexOfMove = 5
            self.performSegue(withIdentifier: "toWeeklyGoalViewFinish", sender: self)
        }
    }
    
    @IBAction func toGoalViewWG3(_ sender: Any) {
        indexOfGoal = 5
        selectedGoal = currentWeeklyGoals[2]
        let index = currentWeeklyGoals[2].getStatus()
        
        if (index == 1) {
            indexOfMove = 3
            self.performSegue(withIdentifier: "toWeeklyGoalViewStart", sender: self)
        }
        else if (index == 2) {
            indexOfMove = 4
            self.performSegue(withIdentifier: "toWeeklyGoalViewOngoing", sender: self)
        }
        else if (index == 3 || index == 4) {
            indexOfMove = 5
            self.performSegue(withIdentifier: "toWeeklyGoalViewFinish", sender: self)
        }
    }
    
    //To pass the goal
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if indexOfMove == 0 {
            let vc = segue.destination as! DailyGoalViewStartViewController
            vc.thisGoal = selectedGoal
            vc.goalIndex = indexOfGoal
        }
        else if indexOfMove == 1 {
            let vc = segue.destination as! DailyGoalViewOngoingViewController
            vc.thisGoal = selectedGoal
            vc.goalIndex = indexOfGoal
        }
        else if indexOfMove == 2 {
            let vc = segue.destination as! DailyGoalViewFinishViewController
            vc.thisGoal = selectedGoal
            vc.goalIndex = indexOfGoal
        }
        else if indexOfMove == 3 {
            let vc = segue.destination as! WeeklyGoalViewStartViewController
            vc.thisGoal = selectedGoal
            vc.goalIndex = indexOfGoal
        }
        else if indexOfMove == 4 {
            let vc = segue.destination as! WeeklyGoalViewOngoingViewController
            vc.thisGoal = selectedGoal
            vc.goalIndex = indexOfGoal
        }
        else if indexOfMove == 5 {
            let vc = segue.destination as! WeeklyGoalViewFinishViewController
            vc.thisGoal = selectedGoal
            vc.goalIndex = indexOfGoal
        }
        saveData()
    }
    
    //Save data
    func saveData() {
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(dailyGoals)
            let json = String(data: jsonData, encoding: .utf8) ?? "{}"
            UserDefaults.standard.set(json, forKey: "dailyGoals")
            UserDefaults.standard.synchronize()
        } catch {
            print("Error")
        }
        
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(currentDailyGoals)
            let json = String(data: jsonData, encoding: .utf8) ?? "{}"
            UserDefaults.standard.set(json, forKey: "currentDailyGoals")
            UserDefaults.standard.synchronize()
        } catch {
            print("Error")
        }
        
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(weeklyGoals)
            let json = String(data: jsonData, encoding: .utf8) ?? "{}"
            UserDefaults.standard.set(json, forKey: "weeklyGoals")
            UserDefaults.standard.synchronize()
        } catch {
            print("Error")
        }
        
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(currentWeeklyGoals)
            let json = String(data: jsonData, encoding: .utf8) ?? "{}"
            UserDefaults.standard.set(json, forKey: "currentWeeklyGoals")
            UserDefaults.standard.synchronize()
        } catch {
            print("Error")
        }
        
        UserDefaults.standard.set(previousDayDate, forKey: "previousDayDate")
    }
    
    //Getting the data
    func getData() {
        do {
            if (UserDefaults.standard.object(forKey: "dailyGoals") == nil) {
                
            }
            else {
                let json = UserDefaults.standard.string(forKey: "dailyGoals") ?? "{}"
                let jsonDecoder = JSONDecoder()
                guard let jsonData = json.data(using: .utf8) else {
                    return
                }
                let theDailyGoals: [Goal] = try jsonDecoder.decode([Goal].self, from: jsonData)
                dailyGoals = theDailyGoals
            }
        } catch {
            print("Error")
        }
        
        do {
            if (UserDefaults.standard.object(forKey: "currentDailyGoals") == nil) {
                return
            }
            else {
                let json = UserDefaults.standard.string(forKey: "currentDailyGoals") ?? "{}"
                let jsonDecoder = JSONDecoder()
                guard let jsonData = json.data(using: .utf8) else {
                    return
                }
                let theCurrentDailyGoals: [Goal] = try jsonDecoder.decode([Goal].self, from: jsonData)
                currentDailyGoals = theCurrentDailyGoals
            }
        } catch {
            print("Error")
        }
        
        do {
            if (UserDefaults.standard.object(forKey: "weeklyGoals") == nil) {
                
            }
            else {
                let json = UserDefaults.standard.string(forKey: "weeklyGoals") ?? "{}"
                let jsonDecoder = JSONDecoder()
                guard let jsonData = json.data(using: .utf8) else {
                    return
                }
                let theWeeklyGoals: [Goal] = try jsonDecoder.decode([Goal].self, from: jsonData)
                weeklyGoals = theWeeklyGoals
            }
        } catch {
            print("Error")
        }
        
        do {
            if (UserDefaults.standard.object(forKey: "currentWeeklyGoals") == nil) {
                
            }
            else {
                let json = UserDefaults.standard.string(forKey: "currentWeeklyGoals") ?? "{}"
                let jsonDecoder = JSONDecoder()
                guard let jsonData = json.data(using: .utf8) else {
                    return
                }
                let theCurrentWeeklyGoals: [Goal] = try jsonDecoder.decode([Goal].self, from: jsonData)
                currentWeeklyGoals = theCurrentWeeklyGoals
            }
        } catch {
            print("Error")
        }
        
        if let previousDay = UserDefaults.standard.object(forKey: "previousDayDate") as? Date {
            previousDayDate = previousDay
        }
    }
}

//Goal class
class Goal: Codable {
    
    var title = ""
    
    var description = ""
    
    var xpPoints = 0
    
    //Variable status is a way of representing the status of a certain goal, with 0 meaning the goal isn't chosen, 1 meaning it is one of the chosen goals, 2 meaning it is a ongoing chosen goal, 3 meaning it is a discarded chosen goal and 4 meaning it is a finished chosen goal.
    var status = 0
    
    var endTime = Date()
    
    var startTime = Date()
    
    var finishedTime = Date()
    
    
    //This variable specifies what type of goal (classification) a certain goal is. 1 for Auditory/Meditation, 2 for Written, 3 for Productivity, 4 for Enviornmental Interaction and 5 for Self Assesment, with 10 as default
    var typeOfGoal = 10
    
    var audioLink = ""
    var titles: String = ""
    var prompts: [String] = []
    
    
    init(title: String, description: String, xpPoints: Int, status: Int) {
        self.title = title
        self.description = description
        self.xpPoints = xpPoints
        self.status = status
    }
    
    func addAudio(link: String){
        self.audioLink = link
    }
    
    func addPromptTitle(title: String){
        self.titles = title
    }
    
    func addPrompts(prompts: [String]){
        self.prompts = prompts
    }
    
    func getTitle() -> String {
        return title
    }
    
    func getDescription() -> String {
        return description
    }
    
    func getxpPoints() -> Int {
        return xpPoints
    }
    
    func getStatus() -> Int {
        return status
    }
    
    func getTypeOfGoal() -> Int {
        return typeOfGoal
    }
    
    func changeTitle(newTitle: String) {
        self.title = newTitle
    }
    
    func changeDescription(newDescription: String) {
        self.description = newDescription
    }
    
    func changeXPPoints(newXPPoints: Int) {
        self.xpPoints = newXPPoints
    }
    
    func changeStatus(newStatus: Int) {
        self.status = newStatus
    }
    
    func changeTypeOfGoal(newTypeOfGoal: Int) {
        self.typeOfGoal = newTypeOfGoal
    }
}
