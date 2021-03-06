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
        
        getData()
        setUpScreen()
    }
    
    //Instance Variables
    var thisGoal = Goal(title: "", description: "", xpPoints: 0, status: 0)
    
    var goalIndex = 10
    
    var dailyGoals: [Goal] = []
                
    //This variable specifies where the view will be switching to, with 0 for staying in the local group, 1 for Auditory/Meditation, 2 for Written and self assemsnet, 3 for Productivity, 4 for Enviornmental Interaction, with 10 as nothing
    var sentTo = 10
    
    var buttonNumber = 0
    
    @IBOutlet weak var timer: UILabel!
    
    @IBOutlet weak var DG1Title: UILabel!
    @IBOutlet weak var DG1Description: UILabel!
    @IBOutlet weak var DG1Reward: UILabel!
    
    @IBOutlet weak var DG1AdditionalResources1: UIButton!
    @IBOutlet weak var DG1AdditionalResources2: UIButton!
    
    let calendar = Calendar.current
    
    //Setting up the screen
    func setUpScreen() {
        DG1Title.text = thisGoal.getTitle()
        DG1Description.text = thisGoal.getDescription()
        let theType = getType()
        DG1Reward.text = "Goal Reward: +\(String(thisGoal.getxpPoints())) \(theType) xp"
        
        DG1AdditionalResources1.backgroundColor = UIColor.lightGray
        DG1AdditionalResources1.setTitle("None", for: .normal)
        DG1AdditionalResources2.backgroundColor = UIColor.lightGray
        DG1AdditionalResources2.setTitle("", for: .normal)
        
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
        
        if thisGoal.getTypeOfGoal() == 1 {
            DG1AdditionalResources1.backgroundColor = UIColor.darkGray
            DG1AdditionalResources1.setTitle("Calming Noises", for: .normal)
        }
        else if thisGoal.getTypeOfGoal() == 2 || thisGoal.getTypeOfGoal() == 5 {
            DG1AdditionalResources1.backgroundColor = UIColor.darkGray
            DG1AdditionalResources1.setTitle("Create a Journal Entry", for: .normal)
            DG1AdditionalResources2.backgroundColor = UIColor.darkGray
            DG1AdditionalResources2.setTitle("My Journal", for: .normal)
        }
        else if thisGoal.getTypeOfGoal() == 3 {
            DG1AdditionalResources1.backgroundColor = UIColor.darkGray
            DG1AdditionalResources1.setTitle("Create a Personalized Goal", for: .normal)
            DG1AdditionalResources2.backgroundColor = UIColor.darkGray
            DG1AdditionalResources2.setTitle("Productivity Journal", for: .normal)
        }
        else if thisGoal.getTypeOfGoal() == 4 {
            DG1AdditionalResources1.backgroundColor = UIColor.darkGray
            DG1AdditionalResources1.setTitle("Create a Journal Entry", for: .normal)
        }
    }
    
    //Getting the type of the goal (for xp)
    func getType() -> String {
        if thisGoal.getTypeOfGoal() == 1 {
            return "Audio"
        }
        else if thisGoal.getTypeOfGoal() == 2 {
            return "Wrriten"
        }
        else if thisGoal.getTypeOfGoal() == 3 {
            return "Productivity"
        }
        else if thisGoal.getTypeOfGoal() == 4 {
            return "Environment"
        }
        else if thisGoal.getTypeOfGoal() == 5 {
            return "Assesment"
        }
        return ""
    }
    
    //Starting the goal
    @IBAction func startGoal(_ sender: Any) {
        thisGoal.changeStatus(newStatus: 2)
        sentTo = 0
        
        self.performSegue(withIdentifier: "toDWGHome", sender: self)
    }
    
    //Return to DWG Home
    @IBAction func toDWGHomeScreen(_ sender: Any) {
        sentTo = 0
        self.performSegue(withIdentifier: "toDWGHome", sender: self)
    }
    
    //Clicked on additional resources 1
    @IBAction func DG1ClickedAdditionalResources1(_ sender: Any) {
        if thisGoal.getTypeOfGoal() == 1 {
            sentTo = 1
            self.performSegue(withIdentifier: "toSound", sender: self)
        }
        else if thisGoal.getTypeOfGoal() == 2 || thisGoal.getTypeOfGoal() == 5 {
            sentTo = 2
            buttonNumber = 1
            self.performSegue(withIdentifier: "toJournalEntry", sender: self)
        }
        else if thisGoal.getTypeOfGoal() == 3 {
            sentTo = 3
            buttonNumber = 1
            self.performSegue(withIdentifier: "toPG", sender: self)
        }
        else if thisGoal.getTypeOfGoal() == 4 {
            sentTo = 4
            self.performSegue(withIdentifier: "toEIEntryVC", sender: self)
        }
    }
    
    //Clicked on additional resources 2
    @IBAction func DG1ClickedAdditionalResources2(_ sender: Any) {
        if thisGoal.getTypeOfGoal() == 2 || thisGoal.getTypeOfGoal() == 5 {
            sentTo = 2
            buttonNumber = 2
            self.performSegue(withIdentifier: "toJournal", sender: self)
        }
        else if thisGoal.getTypeOfGoal() == 3 {
            sentTo = 3
            buttonNumber = 2
            self.performSegue(withIdentifier: "toProductivityVC", sender: self)
        }
    }
    
    //To pass information back to the home screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sentTo == 0 {
            if (goalIndex == 0) {
                dailyGoals[0] = thisGoal
            }
            else if (goalIndex == 1) {
                dailyGoals[1] = thisGoal
            }
            else if (goalIndex == 2) {
                dailyGoals[2] = thisGoal
            }
        }
        
        if sentTo == 1 {
            let newVc = segue.destination as! AudioProgressController
            newVc.origin = 1
            newVc.thisGoal = thisGoal
            newVc.goalIndex = goalIndex
            newVc.name = thisGoal.getAudio()
        }
        else if sentTo == 2 && buttonNumber == 1 {
            let newVc = segue.destination as! LongPromptController
            newVc.origin = 1
            newVc.thisGoal = thisGoal
            newVc.goalIndex = goalIndex
            newVc.promptTitle = thisGoal.getTitle()
        }
        else if sentTo == 2 && buttonNumber == 2 {
            let newVc = segue.destination as! JournalController
            newVc.origin = 1
            newVc.thisGoal = thisGoal
            newVc.goalIndex = goalIndex
        }
        else if sentTo == 3 && buttonNumber == 2 {
            let newVc = segue.destination as! ProductivityJournalViewController
            newVc.origin = 1
            newVc.thisGoal = thisGoal
            newVc.goalIndex = goalIndex
        }
        else if sentTo == 4 {
            let newVc = segue.destination as! EIEntryViewController
            newVc.origin = 1
            newVc.thisGoal = thisGoal
            newVc.goalIndex = goalIndex
            newVc.promptTitle = thisGoal.getTitle()
        }
        saveData()
    }
    
    //Save data
    func saveData() {
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(dailyGoals)
            let json = String(data: jsonData, encoding: .utf8) ?? "{}"
            UserDefaults.standard.set(json, forKey: "currentDailyGoals")
            UserDefaults.standard.synchronize()
        } catch {
            print("Error")
        }
    }
    
    //Getting the data
    func getData() {
        do {
            if (UserDefaults.standard.object(forKey: "currentDailyGoals") == nil) {
                
            }
            else {
                let json = UserDefaults.standard.string(forKey: "currentDailyGoals") ?? "{}"
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
    }
}
