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

        initGoals()
        setUpScreen()
    }
    
    //Starting - Everytime this view is loaded
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (checkDay()) {
            chooseDailyGoals()
            if (checkWeek()) {
                chooseWeeklyGoals()
            }
        }
        setUpScreen()
    }
    
    //Instance Variables
    var dailyGoals: [Goal] = []
    var currentDailyGoals: [Goal] = []
    
    var weeklyGoals: [Goal] = []
    var currentWeeklyGoals: [Goal] = []
    
    var selectedGoal = Goal(title: "", description: "", xpPoints: 0, status: 0)
    
    //This variable is to show which goal view will be switched to, with 0 for daily start, 1 for daily ongoing, 2 for daily finished, 3 for weekly start, 4 for weekly ongoing and 5 for weekly finished
    var indexOfMove = 0
    
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
        //Initializing the daily goals (still need to persoanlize info)
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        
        //Initializing the weekly goals (still need to persoanlize info)
        weeklyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        weeklyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        weeklyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        weeklyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        weeklyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        weeklyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        weeklyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        weeklyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        weeklyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        weeklyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        weeklyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        weeklyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        weeklyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        weeklyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        weeklyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        
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
    
    //Switching to Personalized Goals
    @IBAction func toPG(_ sender: Any) {
        indexOfMove = 10
        self.performSegue(withIdentifier: "toPG", sender: self)
    }
    
    //Switching to Goal View (Daily)
    @IBAction func toGoalViewDG1(_ sender: Any) {
        selectedGoal = currentDailyGoals[0]
        let index = 1//currentDailyGoals[0].getStatus()
        
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
        selectedGoal = currentDailyGoals[1]
        let index = 2//currentDailyGoals[1].getStatus()
        
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
        selectedGoal = currentDailyGoals[2]
        let index = 3//currentDailyGoals[2].getStatus()
        
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
        selectedGoal = currentWeeklyGoals[0]
        let index = 1//currentWeeklyGoals[0].getStatus()
        
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
        selectedGoal = currentWeeklyGoals[0]
        let index = 2//currentWeeklyGoals[1].getStatus()
        
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
        selectedGoal = currentWeeklyGoals[0]
        let index = 3//currentWeeklyGoals[2].getStatus()
        
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
        }
        else if indexOfMove == 1 {
            let vc = segue.destination as! DailyGoalViewOngoingViewController
            vc.thisGoal = selectedGoal
        }
        else if indexOfMove == 2 {
            let vc = segue.destination as! DailyGoalViewFinishViewController
            vc.thisGoal = selectedGoal
        }
        else if indexOfMove == 3 {
            let vc = segue.destination as! WeeklyGoalViewStartViewController
            vc.thisGoal = selectedGoal
        }
        else if indexOfMove == 4 {
            let vc = segue.destination as! WeeklyGoalViewOngoingViewController
            vc.thisGoal = selectedGoal
        }
        else if indexOfMove == 5 {
            let vc = segue.destination as! WeeklyGoalViewFinishViewController
            vc.thisGoal = selectedGoal
        }
    }
}

//Goal class
class Goal {
    
    var title = ""
    
    var description = ""
    
    var xpPoints = 0
    
    //Variable status is a way of representing the status of a certain goal, with 0 meaning the goal isn't chosen, 1 meaning it is one of the chosen goals, 2 meaning it is a ongoing chosen goal, 3 meaning it is a discarded chosen goal and 4 meaning it is a finished chosen goal.
    var status = 0
    
    
    init(title: String, description: String, xpPoints: Int, status: Int) {
        self.title = title
        self.description = description
        self.xpPoints = xpPoints
        self.status = status
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
}
