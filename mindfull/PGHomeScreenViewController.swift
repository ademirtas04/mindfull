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
        
        if fromLocalGroup == false {
            getData()
        }
        
        updateForTime()
        updateForTime()
        updateForTime()
        
        updateDay()
        setUpScreen()
    }
    
     //Instance Variables
    var personalGoals: [personalGoal] = []
    
    var selectedGoal = personalGoal(title: "", description: "", xpPoints: 0, status: 0, endTime: Date(), startTime: Date(), finishedTime: Date())
    
    var productivityJournal: [personalGoal] = []
        
    var goalsDoneToday = 0
    
    //Index of move tells where we are switching to, with 0 meaning swicthing to new goal, 1 meaning swicthing to ongoing and 2 swicthing to finished and 10 as the deafault
    var indexOfMove = 10
    
    //Index of goal tells which goal we are looking at, with 0 for spot 1 1 for goal 2 and 2 for goal 3.
    var indexOfGoal =  10
    
    //Special status is true when we have three goals on the screen (with some of them discarded and finished) in order to allow for the creation of new goals
    var specialStatus = false
    
    //Special status index tells the new goal controller where to put a new goal if there are already three goals in the array
    var specialStatusIndex = 10
    
    var fromLocalGroup = false
    
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
    
    @IBOutlet weak var newButton: UIButton!
    let calendar = Calendar.current
    
    var previousDayDate = Date()
    
    //Setting up the screen
    func setUpScreen() {
        var count = 0
        let size = personalGoals.count
        if (size >= 1) {
            PG1Title.text = personalGoals[0].getTitle()
            PG1Reward.text  = "+\(String(personalGoals[0].getxpPoints()))xp"
            
            if (personalGoals[0].getStatus() == 1) {
                PG1Button.backgroundColor = UIColor.lightGray
            }
            else if (personalGoals[0].getStatus() == 2) {
                PG1Timer.text = getTimerLabel(goal: personalGoals[0])
                PG1Button.backgroundColor = UIColor.yellow
            }
            else if (personalGoals[0].getStatus() == 3) {
                PG1Timer.text = "You discarded this goal :("
                PG1Button.backgroundColor = UIColor.red
            }
            else if (personalGoals[0].getStatus() == 4) {
                PG1Timer.text = "You finished this goal!"
                PG1Button.backgroundColor = UIColor.green
            }
        }
        if (size >= 2) {
            PG2Title.text = personalGoals[1].getTitle()
            PG2Reward.text  = "+\(String(personalGoals[1].getxpPoints()))xp"
            
            if (personalGoals[1].getStatus() == 1) {
                PG2Button.backgroundColor = UIColor.lightGray
            }
            else if (personalGoals[1].getStatus() == 2) {
                PG2Timer.text = getTimerLabel(goal: personalGoals[1])
                PG2Button.backgroundColor = UIColor.yellow
            }
            else if (personalGoals[1].getStatus() == 3) {
                PG2Timer.text = "You discarded this goal :("
                PG2Button.backgroundColor = UIColor.red
            }
            else if (personalGoals[1].getStatus() == 4) {
                PG2Timer.text = "You finished this goal!"
                PG2Button.backgroundColor = UIColor.green
            }
        }
        if (size == 3) {
            PG3Title.text = personalGoals[2].getTitle()
            PG3Reward.text  = "+\(String(personalGoals[2].getxpPoints()))xp"
            
            if (personalGoals[2].getStatus() == 1) {
                PG3Button.backgroundColor = UIColor.lightGray
            }
            else if (personalGoals[2].getStatus() == 2) {
                PG3Timer.text = getTimerLabel(goal: personalGoals[2])
                PG3Button.backgroundColor = UIColor.yellow
            }
            else if (personalGoals[2].getStatus() == 3) {
                PG3Timer.text = "You discarded this goal :("
                PG3Button.backgroundColor = UIColor.red
            }
            else if (personalGoals[2].getStatus() == 4) {
                PG3Timer.text = "You finished this goal!"
                PG3Button.backgroundColor = UIColor.green
            }
            
            if (personalGoals[0].getStatus() == 2) {
                count = count + 1
            }
            if (personalGoals[1].getStatus() == 2) {
                count = count + 1
            }
            if (personalGoals[2].getStatus() == 2) {
                count = count + 1
            }
        }
        
        if count == 3 || goalsDoneToday == 6 {
            newButton.backgroundColor = UIColor.purple
            newButton.setTitleColor(UIColor.white, for: .normal)
            newButton.setTitle("Can't Create New Goals at This Time", for: .normal)
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
    
    //Find time
    func getTimerLabel(goal: personalGoal) -> String {
        let rightNow = Date()
        let endTime = goal.getEndTime()
        
        let rightNowWeek = calendar.dateComponents([.weekOfYear], from: rightNow).weekOfYear!
        let rightNowDay = calendar.dateComponents([.weekday], from: rightNow).weekday!
        let rightNowHour = calendar.dateComponents([.hour], from: rightNow).hour!
        let rightNowMinute = calendar.dateComponents([.minute], from: rightNow).minute!
        
        let endWeek = calendar.dateComponents([.weekOfYear], from: endTime).weekOfYear!
        var endDay = calendar.dateComponents([.weekday], from: endTime).weekday!
        var endHour = calendar.dateComponents([.hour], from: endTime).hour!
        var endMinute = calendar.dateComponents([.minute], from: endTime).minute!
        
        if rightNowMinute > endMinute {
            endMinute = endMinute + 60
            endHour = endHour - 1
        }
        
        if rightNowHour > endHour {
            endHour = endHour + 24
            endDay = endDay - 1
        }
        
        let minutesLeft = endMinute - rightNowMinute
        let hoursLeft = endHour - rightNowHour
        var daysLeft = endDay - rightNowDay
        
        if rightNowWeek != endWeek {
            let weeksLeft = endWeek - rightNowWeek
            daysLeft = daysLeft + weeksLeft*7
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
    
    //Check to see if any goal's end time has passed and if so remove the goal
    func updateForTime() {
        let rightNow = Date()
        
        let rightNowWeek = calendar.dateComponents([.weekOfYear], from: rightNow).weekOfYear!
        let rightNowDay = calendar.dateComponents([.weekday], from: rightNow).weekday!
        let rightNowHour = calendar.dateComponents([.hour], from: rightNow).hour!
        let rightNowMinute = calendar.dateComponents([.minute], from: rightNow).minute!
        
        if (personalGoals.count != 0) {
            for index in 1...personalGoals.count {
                var remove = false
                let endTime = personalGoals[index-1].getEndTime()
                let endWeek = calendar.dateComponents([.weekOfYear], from: endTime).weekOfYear!
                let endDay = calendar.dateComponents([.weekday], from: endTime).weekday!
                let endHour = calendar.dateComponents([.hour], from: endTime).hour!
                let endMinute = calendar.dateComponents([.minute], from: endTime).minute!
                
                if (rightNowWeek > endWeek) {
                    remove = true
                }
                else if (rightNowWeek == endWeek) {
                    if (rightNowDay > endDay) {
                        remove = true
                    }
                    else if (rightNowDay == endDay) {
                        if (rightNowHour > endHour) {
                            remove = true
                        }
                        else if (rightNowHour == endHour) {
                            if (rightNowMinute > endMinute) {
                                remove = true
                            }
                        }
                    }
                }
                if (remove == true) {
                    personalGoals.remove(at: index-1)
                    return
                }
            }
        }
        return
    }
    
    //Switching to My Goals Home Screen
    @IBAction func toMyGoals(_ sender: Any) {
        saveData()
        indexOfGoal = 10
        indexOfMove = 10
        self.performSegue(withIdentifier: "toMyGoals", sender: self)
    }
    
    //Switching to New Goal
    @IBAction func toNewGoal(_ sender: Any) {
        var count = 0
        if (personalGoals.count == 3) {
            for index in 1...3 {
                if (personalGoals[index-1].getStatus() == 2) {
                    count = count + 1
                }
            }
        }
        
        if count != 3 && goalsDoneToday != 6 {
            if (personalGoals.count == 3) {
                specialStatus = true
                for index in 1...3 {
                    if (personalGoals[index-1].getStatus() != 2) {
                        specialStatusIndex = index - 1
                    }
                }
            }
            indexOfMove = 0
            self.performSegue(withIdentifier: "toPGNewGoal", sender: self)
        }
    }
    
    //Switching to Personal Goal View
    @IBAction func toPG1(_ sender: Any) {
        if (personalGoals.count > 0) {
            let index = personalGoals[0].getStatus()
            indexOfGoal = 0
            selectedGoal = personalGoals[0]
        
            if (index == 2) {
                indexOfMove = 1
                self.performSegue(withIdentifier: "toPGGoalViewOngoing", sender: self)
            }
            else if (index == 3 || index == 4) {
                indexOfMove = 2
                self.performSegue(withIdentifier: "toPGGoalViewFinish", sender: self)
            }
        }
        else {
            indexOfMove = 0
            self.performSegue(withIdentifier: "toPGNewGoal", sender: self)
        }
    }
    
    @IBAction func toPG2(_ sender: Any) {
        if (personalGoals.count > 1) {
            let index = personalGoals[1].getStatus()
            indexOfGoal = 1
            selectedGoal = personalGoals[1]
        
            if (index == 2) {
                indexOfMove = 1
                self.performSegue(withIdentifier: "toPGGoalViewOngoing", sender: self)
            }
            else if (index == 3 || index == 4) {
                indexOfMove = 2
                self.performSegue(withIdentifier: "toPGGoalViewFinish", sender: self)
            }
        }
        else {
            indexOfMove = 0
            self.performSegue(withIdentifier: "toPGNewGoal", sender: self)
        }
    }
    
    @IBAction func toPG3(_ sender: Any) {
        if (personalGoals.count > 2) {
            let index = personalGoals [2].getStatus()
            indexOfGoal = 2
            selectedGoal = personalGoals[2]
        
            if (index == 2) {
                indexOfMove = 1
                self.performSegue(withIdentifier: "toPGGoalViewOngoing", sender: self)
            }
            else if (index == 3 || index == 4) {
                indexOfMove = 2
                self.performSegue(withIdentifier: "toPGGoalViewFinish", sender: self)
            }
        }
        else {
            indexOfMove = 0
            self.performSegue(withIdentifier: "toPGNewGoal", sender: self)
        }
    }
    
    //To pass the goal
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if indexOfMove == 0 {
            let vc = segue.destination as! PGNewGoalViewController
            vc.personalGoals = personalGoals
            vc.thisGoal = selectedGoal
            vc.goalIndex = indexOfGoal
            vc.goalsDoneToday = goalsDoneToday
            vc.specialStatus = specialStatus
            vc.specialStatusIndex = specialStatusIndex
        }
        else if indexOfMove == 1 {
            let vc = segue.destination as! PGGoalViewOngoingViewController
            vc.personalGoals = personalGoals
            vc.thisGoal = selectedGoal
            vc.goalIndex = indexOfGoal
            vc.goalsDoneToday = goalsDoneToday
            vc.productivityJournal = productivityJournal
        }
        else if indexOfMove == 2 {
            let vc = segue.destination as! PGGoalViewFinishViewController
            vc.personalGoals = personalGoals
            vc.thisGoal = selectedGoal
            vc.goalIndex = indexOfGoal
            vc.goalsDoneToday = goalsDoneToday
        }
    }
    
    //Saving the data
    func saveData() {
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(personalGoals)
            let json = String(data: jsonData, encoding: .utf8) ?? "{}"
            UserDefaults.standard.set(json, forKey: "personalGoals")
            UserDefaults.standard.synchronize()
        } catch {
            print("Error")
        }
        
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(productivityJournal)
            let json = String(data: jsonData, encoding: .utf8) ?? "{}"
            UserDefaults.standard.set(json, forKey: "productivityJournal")
            UserDefaults.standard.synchronize()
        } catch {
            print("Error")
        }
        
        UserDefaults.standard.set(goalsDoneToday, forKey: "goalsDoneToday")
        UserDefaults.standard.set(previousDayDate, forKey: "previousDayDate2")
    }
    
    //Getting the data
    func getData() {
        do {
            if (UserDefaults.standard.object(forKey: "personalGoals") == nil) {
                
            }
            else {
                let json = UserDefaults.standard.string(forKey: "personalGoals") ?? "{}"
                let jsonDecoder = JSONDecoder()
                guard let jsonData = json.data(using: .utf8) else {
                    return
                }
                let thePersonalGoals: [personalGoal] = try jsonDecoder.decode([personalGoal].self, from: jsonData)
                personalGoals = thePersonalGoals
            }
        } catch {
            print("Error")
        }
        
        do {
            if (UserDefaults.standard.object(forKey: "productivityJournal") == nil) {
                
            }
            else {
                let json = UserDefaults.standard.string(forKey: "productivityJournal") ?? "{}"
                let jsonDecoder = JSONDecoder()
                guard let jsonData = json.data(using: .utf8) else {
                    return
                }
                let theProductivityJournal: [personalGoal] = try jsonDecoder.decode([personalGoal].self, from: jsonData)
                productivityJournal = theProductivityJournal
            }
        } catch {
            print("Error")
        }
        
        if let goalsDone = UserDefaults.standard.object(forKey: "goalsDoneToday") as? Int {
            goalsDoneToday = goalsDone
        }
        
        if let previousDay = UserDefaults.standard.object(forKey: "previousDayDate2") as? Date {
            previousDayDate = previousDay
        }
    }
}

//Personal Goal class
class personalGoal: Goal {
    
    init(title: String, description: String, xpPoints: Int, status: Int, endTime: Date, startTime: Date, finishedTime: Date) {
        super.init(title: title, description: description, xpPoints: xpPoints, status: status)
        super.endTime = endTime
        super.startTime = startTime
        super.finishedTime = finishedTime
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    
    func getEndTime() -> Date {
        return super.endTime
    }
    
    func getStartTime() -> Date {
        return super.startTime
    }
    
    func getFinishedTime() -> Date {
        return super.finishedTime
    }
    
    func changeEndTime(newEndTime: Date) {
        super.endTime = newEndTime
    }
    
    func changeStartTime(newStartTime: Date) {
        super.startTime = newStartTime
    }
    
    func changeFinishedTime(newFinishedTime: Date) {
        super.finishedTime = newFinishedTime
    }
}
