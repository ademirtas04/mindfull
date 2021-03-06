//
//  ProductivityJournalViewController.swift
//  mindfull
//
//  Created by Tyler Turek on 8/11/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class ProductivityJournalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Starting - Everytime this view is loaded
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getData()
        currentEntryIndex = productivityJournal.count - 1
        setUpScreen()
    }
    
    //Instance Variables
    var productivityJournal: [personalGoal] = []
    
    var currentEntryIndex = 0
    
    var thisGoal = Goal(title: "", description: "", xpPoints: 0, status: 0)
       
    var goalIndex = 10
    
    //Origin tells us where we are coming from, 0 default to personalized goals, 1 from DGStart, 2 from DGOngoing, 3 from DGFinish, 4 from WGStart, 5 from WGOngoing and 6 from WGFinish
    var origin = 0
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var goalTitleLabel: UILabel!
    @IBOutlet weak var goalDescriptionLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    let calendar = Calendar.current
    
    //Setting up the screen for when this view first loads or when the user clicks to see a different entry
    func setUpScreen() {
        if productivityJournal.count == 0 {
            previousButton.setTitle("", for: .normal)
            nextButton.setTitle("", for: .normal)
            dateLabel.text = ""
            startDateLabel.text = ""
            goalTitleLabel.text = ""
            goalDescriptionLabel.text = "Hmm, it seems that you have no entries for this journal"
            endTimeLabel.text = ""
            previousButton.backgroundColor = UIColor.white
            nextButton.backgroundColor = UIColor.white
        }
            
        else if currentEntryIndex >= 0 && productivityJournal.count > 0 {
            if currentEntryIndex >= 1 {
                previousButton.setTitle("Previous", for: .normal)
                previousButton.backgroundColor = UIColor.lightGray
            }
            else {
                previousButton.setTitle("", for: .normal)
                previousButton.backgroundColor = UIColor.white
            }
            if currentEntryIndex < productivityJournal.count - 1 {
                nextButton.setTitle("Next", for: .normal)
                nextButton.backgroundColor = UIColor.lightGray
            }
            else {
                nextButton.setTitle("", for: .normal)
                nextButton.backgroundColor = UIColor.white
            }
    
            let theEntry = productivityJournal[currentEntryIndex]
            let startDate = theEntry.getStartTime()
            let finishedDate = theEntry.getFinishedTime()
        
            dateLabel.text = "-- \(getYMD(theDate: finishedDate)) --"
            startDateLabel.text = "On \(getYMDHM(theDate: startDate)) I created the following goal for myself:"
            goalTitleLabel.text = "Goal Name: \(theEntry.getTitle())"
            goalDescriptionLabel.text = "Goal Description: \(theEntry.getDescription())"
            endTimeLabel.text = "I was able to finish this goal on \(getYMDHM(theDate: finishedDate))"
        }
    }
    
    //Get the year, month and day as a string
    func getYMD (theDate: Date) -> String {
        let theDateYear = calendar.dateComponents([.year], from: theDate).year!
        let theDateMonth = calendar.dateComponents([.month], from: theDate).month!
        let theDateDay = calendar.dateComponents([.day], from: theDate).day!
        let monthString = EIEntryViewController().convertToMonth(month: theDateMonth)
        return "\(monthString) \(theDateDay), \(theDateYear)"
    }
    
    //Get the year, month, day, hour and minute as a string
    func getYMDHM (theDate: Date) -> String {
        let theDateYMD = getYMD(theDate: theDate)
        let theDateHour = calendar.dateComponents([.hour], from: theDate).hour!
        let theDateMinute = calendar.dateComponents([.minute], from: theDate).minute!
        return "\(theDateYMD) at \(theDateHour):\(theDateMinute)"
    }
    
    //Switching to the previous entry of the journal
    @IBAction func previousEntry(_ sender: Any) {
        if currentEntryIndex >= 1 {
            currentEntryIndex = currentEntryIndex - 1
            setUpScreen()
        }
    }
    
    //Switching to the next entry of the journal
    @IBAction func nextEntry(_ sender: Any) {
        if currentEntryIndex < productivityJournal.count - 1 {
            currentEntryIndex = currentEntryIndex + 1
            setUpScreen()
        }
    }
    
    //When the player is done looking at the journal
    @IBAction func done(_ sender: Any) {
        saveData()

        if origin == 0 {
            self.performSegue(withIdentifier: "toPersonalizedGoal", sender: self)
        }
        else if origin == 1 {
            self.performSegue(withIdentifier: "toDG1", sender: self)
        }
        else if origin == 2 {
            self.performSegue(withIdentifier: "toDG2", sender: self)
        }
        else if origin == 3 {
            self.performSegue(withIdentifier: "toDG3", sender: self)
        }
        else if origin == 4 {
            self.performSegue(withIdentifier: "toWG1", sender: self)
        }
        else if origin == 5 {
            self.performSegue(withIdentifier: "toWG2", sender: self)
        }
        else if origin == 6 {
            self.performSegue(withIdentifier: "toWG3", sender: self)
        }
    }
    
    //Switch to the personalized goals home screen
    @IBAction func toPersonalizedGoals(_ sender: Any) {
        origin = 0
        saveData()
        self.performSegue(withIdentifier: "toPersonalizedGoals", sender: self)
    }
    
    //To pass information back to where we came from
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if origin == 1 {
            let vc = segue.destination as! DailyGoalViewStartViewController
            vc.goalIndex = goalIndex
            vc.thisGoal = thisGoal
        }
        else if origin == 2 {
            let vc = segue.destination as! DailyGoalViewOngoingViewController
            vc.goalIndex = goalIndex
            vc.thisGoal = thisGoal
        }
        else if origin == 3 {
            let vc = segue.destination as! DailyGoalViewFinishViewController
            vc.goalIndex = goalIndex
            vc.thisGoal = thisGoal
        }
        else if origin == 4 {
            let vc = segue.destination as! WeeklyGoalViewStartViewController
            vc.goalIndex = goalIndex
            vc.thisGoal = thisGoal
        }
        else if origin == 5 {
            let vc = segue.destination as! WeeklyGoalViewOngoingViewController
            vc.goalIndex = goalIndex
            vc.thisGoal = thisGoal
        }
        else if origin == 6 {
            let vc = segue.destination as! WeeklyGoalViewFinishViewController
            vc.goalIndex = goalIndex
            vc.thisGoal = thisGoal
        }
    }
    
    //Saving the data
    func saveData() {
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(productivityJournal)
            let json = String(data: jsonData, encoding: .utf8) ?? "{}"
            UserDefaults.standard.set(json, forKey: "productivityJournal")
            UserDefaults.standard.synchronize()
        } catch {
            print("Error")
        }
    }
    
    //Getting the data
    func getData() {
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
    }
}
