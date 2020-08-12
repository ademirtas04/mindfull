//
//  EIJournalViewController.swift
//  mindfull
//
//  Created by Tyler Turek on 8/10/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class EIJournalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //Starting - Everytime this view is loaded
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getData()
        currentEntryIndex = EIJournal.count - 1
        setUpScreen()
    }
    
    //Instance variables
    var EIJournal: [EIEntry] = []
    
    var thisGoal = Goal(title: "", description: "", xpPoints: 0, status: 0)
    
    var dailyGoals: [Goal] = []
        
    var weeklyGoals: [Goal] = []
        
    var currentEntryIndex = 0
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var interactionLabel: UILabel!
    @IBOutlet weak var feelingLabel: UILabel!
    
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    //Origin tells us where we are coming from, 0 from the journal, 1 from DGStart, 2 from DGOngoing, 3 from DGFinish, 4 from WGStart, 5 from WGOngoing and 6 from WGFinish
    var origin = 0
    
    var journal = false
    
    //Setting up the screen for when this view first loads or when the user clicks to see a different entry
    func setUpScreen() {
        if EIJournal.count == 0 {
            previousButton.setTitle("", for: .normal)
            nextButton.setTitle("", for: .normal)
            dateLabel.text = ""
            infoLabel.text = ""
            interactionLabel.text = "Hmm, it seems that you have no entries for this journal"
            feelingLabel.text = ""
            previousButton.backgroundColor = UIColor.white
            nextButton.backgroundColor = UIColor.white
        }
            
        else if currentEntryIndex >= 0 && EIJournal.count > 0 {
            if currentEntryIndex >= 1 {
                previousButton.setTitle("Previous", for: .normal)
                previousButton.backgroundColor = UIColor.lightGray
            }
            else {
                previousButton.setTitle("", for: .normal)
                previousButton.backgroundColor = UIColor.white
            }
            if currentEntryIndex < EIJournal.count - 1 {
                nextButton.setTitle("Next", for: .normal)
                nextButton.backgroundColor = UIColor.lightGray
            }
            else {
                nextButton.setTitle("", for: .normal)
                nextButton.backgroundColor = UIColor.white
            }
    
            let theEntry = EIJournal[currentEntryIndex]
            dateLabel.text = "-- \(theEntry.getDate()) --"
            infoLabel.text = "On \(theEntry.getDate()) I went on a \(theEntry.getExercise()) for \(theEntry.getTime()) and interacted with the environment"
            interactionLabel.text = "During this time I saw \(theEntry.getWhatTheySaw()), touched \(theEntry.getWhatTheyTouched()) and heard \(theEntry.getWhatTheyHeard()). Additiaonlly, I also smelled \(theEntry.getWhatTheySmelled())."
            feelingLabel.text = "By the end I felt \(theEntry.getEmotions())."
        }
    }
    
    //When the player is done looking at the journal
    @IBAction func done(_ sender: Any) {
        saveData()
        whereToGo()
    }
    
    //When the player goes to the previous entry
    @IBAction func previousEntry(_ sender: Any) {
        if currentEntryIndex >= 1 {
            currentEntryIndex = currentEntryIndex - 1
            setUpScreen()
        }
    }
    
    //When the player goes to the next entry
    @IBAction func nextEntry(_ sender: Any) {
        if currentEntryIndex < EIJournal.count - 1 {
            currentEntryIndex = currentEntryIndex + 1
            setUpScreen()
        }
    }
    
    @IBAction func newEntry(_ sender: Any) {
        journal = true
        self.performSegue(withIdentifier: "toNewEntry", sender: self)
    }
    
    //Determine where to go
    func whereToGo() {
        if journal == true {
            self.performSegue(withIdentifier: "toEIJournal", sender: self)
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
    
    //To pass information back to where we came from
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if journal == true {
            let vc = segue.destination as! EIEntryViewController
            vc.origin = origin
            vc.dailyGoals = dailyGoals
            vc.weeklyGoals = weeklyGoals
            vc.thisGoal = thisGoal
        }
        else if origin == 1 {
            let vc = segue.destination as! DailyGoalViewStartViewController
            vc.dailyGoals = dailyGoals
            vc.thisGoal = thisGoal
        }
        else if origin == 2 {
            let vc = segue.destination as! DailyGoalViewOngoingViewController
            vc.dailyGoals = dailyGoals
            vc.thisGoal = thisGoal
        }
        else if origin == 3 {
            let vc = segue.destination as! DailyGoalViewFinishViewController
            vc.dailyGoals = dailyGoals
            vc.thisGoal = thisGoal
        }
        else if origin == 4 {
            let vc = segue.destination as! WeeklyGoalViewStartViewController
            vc.weeklyGoals = weeklyGoals
            vc.thisGoal = thisGoal
        }
        else if origin == 5 {
            let vc = segue.destination as! WeeklyGoalViewOngoingViewController
            vc.weeklyGoals = weeklyGoals
            vc.thisGoal = thisGoal
        }
        else if origin == 6 {
            let vc = segue.destination as! WeeklyGoalViewFinishViewController
            vc.weeklyGoals = weeklyGoals
            vc.thisGoal = thisGoal
        }
    }
    
    //Saving the data
    func saveData() {
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(EIJournal)
            let json = String(data: jsonData, encoding: .utf8) ?? "{}"
            UserDefaults.standard.set(json, forKey: "EIJournal")
            UserDefaults.standard.synchronize()
        } catch {
            print("Error")
        }
    }
    
    //Getting the data
    func getData() {
        do {
            if (UserDefaults.standard.object(forKey: "EIJournal") == nil) {
                
            }
            else {
                let json = UserDefaults.standard.string(forKey: "EIJournal") ?? "{}"
                let jsonDecoder = JSONDecoder()
                guard let jsonData = json.data(using: .utf8) else {
                    return
                }
                let theEIJournal: [EIEntry] = try jsonDecoder.decode([EIEntry].self, from: jsonData)
                EIJournal = theEIJournal
            }
        } catch {
            print("Error")
        }
    }
}
