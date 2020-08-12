//
//  DailyGoalViewFinishViewController.swift
//  mindfull
//
//  Created by Tyler Turek on 8/4/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class DailyGoalViewFinishViewController: UIViewController {

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
                
    //This variable specifies where the view will be switching to, with 0 for staying in the local group, 1 for Auditory/Meditation, 2 for Written, 3 for Productivity, 4 for Enviornmental Interaction and 5 for Self Assesment, with 10 as nothing
    var sentTo = 10
    
    @IBOutlet weak var timer: UILabel!
    
    @IBOutlet weak var completionNotice: UILabel!
    
    @IBOutlet weak var DG3Title: UILabel!
    @IBOutlet weak var DG3Description: UILabel!
    @IBOutlet weak var DG3Reward: UILabel!
    
    @IBOutlet weak var DG3AdditionalResources1: UIButton!
    @IBOutlet weak var DG3AdditionalResources2: UIButton!
    
    let calendar = Calendar.current
    
    //Setting up the screen
    func setUpScreen() {
        if thisGoal.getStatus() == 3 {
            completionNotice.text = "You have discarded this goal :("
        }
        else if (thisGoal.getStatus() == 4) {
            completionNotice.text = "You have already completed this goal!"
        }
        
        DG3Title.text = thisGoal.getTitle()
        DG3Description.text = thisGoal.getDescription()
        DG3Reward.text = "Goal Reward: +\(String(thisGoal.getxpPoints()))xp"
        
        DG3AdditionalResources1.backgroundColor = UIColor.lightGray
        DG3AdditionalResources1.setTitle("None", for: .normal)
        DG3AdditionalResources2.backgroundColor = UIColor.lightGray
        DG3AdditionalResources2.setTitle("", for: .normal)
        
        let rightNow = Date()
        let nowHour = calendar.dateComponents([.hour], from: rightNow).hour!
        let nowMinute = calendar.dateComponents([.minute], from: rightNow).minute!
        
        var hoursLeft = 24 - nowHour - 1
        var minutesLeft = 60 - nowMinute
        if minutesLeft == 60 {
            hoursLeft = hoursLeft + 1
            minutesLeft = 0
        }
        
        timer.text = "A new Daily Goal will Appear in \(hoursLeft) Hours \(minutesLeft) Minutes"
        
        if thisGoal.getTypeOfGoal() == 4 {
            DG3AdditionalResources1.backgroundColor = UIColor.darkGray
            DG3AdditionalResources1.setTitle("Create a Journal Entry", for: .normal)
        }
    }
    
    //Return to DWG Home
    @IBAction func toDWGHomeScreen(_ sender: Any) {
        sentTo = 0
        
        self.performSegue(withIdentifier: "toDWGHome", sender: self)
    }
    
    //Clicked on additional resources 1
    @IBAction func DG3ClickedAdditionalResources1(_ sender: Any) {
        if thisGoal.getTypeOfGoal() == 4 {
            sentTo = 4
            self.performSegue(withIdentifier: "toEIEntryVC", sender: self)
        }
    }
    
    //Clicked on additional resources 2
    @IBAction func DG3ClickedAdditionalResources2(_ sender: Any) {
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
        
        if sentTo == 4 {
            let newVc = segue.destination as! EIEntryViewController
            newVc.origin = 3
            newVc.thisGoal = thisGoal
            newVc.goalIndex = goalIndex
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
