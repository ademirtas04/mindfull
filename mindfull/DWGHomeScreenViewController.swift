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
        chooseGoals()
        setUpScreen()
    }
    
    //Starting - Everytime this view is loaded
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateScreen()
    }
    
    //Instance Variables
    var dailyGoals: [Goal] = []
    
    var currentDailyGoals: [Goal] = []
    
    var weeklyGoals: [Goal] = []
    
    var currentWeeklyGoals: [Goal] = []
    
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
    
    //Initializing the goals
    func initGoals() {
        //Initializing the daily goals
        dailyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
        
        //Initializing the weekly goals
        weeklyGoals.append(Goal(title: "Title", description: "Description", xpPoints: 10, status: 0))
    }
    
    //Choosing the goals
    func chooseGoals() {
        
    }
    
    //Setup the buttons
    func setUpScreen() {
        
    }
    
    //Update the screen when users come back from Goal View
    func updateScreen() {
        
    }
    
    //Switching to Journey
    @IBAction func toJourney(_ sender: Any) {
        self.performSegue(withIdentifier: "toJourney", sender: self)
    }
    
    //Switching to Goal View (Daily)
    @IBAction func toGoalViewDG1(_ sender: Any) {
        var index = 1 //Here we will find the status value for chosen daily goal 1
        
        if (index == 1) {
            self.performSegue(withIdentifier: "toDailyGoalViewStart", sender: self)
        }
        else if (index == 2) {
            self.performSegue(withIdentifier: "toDailyGoalViewOngoing", sender: self)
        }
        else if (index == 3 || index == 4) {
            self.performSegue(withIdentifier: "toDailyGoalViewFinish", sender: self)
        }
    }
    
    @IBAction func toGoalViewDG2(_ sender: Any) {
        var index = 2 //Here we will find the status value for chosen daily goal 2
        
        if (index == 1) {
            self.performSegue(withIdentifier: "toDailyGoalViewStart", sender: self)
        }
        else if (index == 2) {
            self.performSegue(withIdentifier: "toDailyGoalViewOngoing", sender: self)
        }
        else if (index == 3 || index == 4) {
            self.performSegue(withIdentifier: "toDailyGoalViewFinish", sender: self)
        }
    }
    
    @IBAction func toGoalViewDG3(_ sender: Any) {
        var index = 3 //Here we will find the status value for chosen daily goal 3
        
        if (index == 1) {
            self.performSegue(withIdentifier: "toDailyGoalViewStart", sender: self)
        }
        else if (index == 2) {
            self.performSegue(withIdentifier: "toDailyGoalViewOngoing", sender: self)
        }
        else if (index == 3 || index == 4) {
            self.performSegue(withIdentifier: "toDailyGoalViewFinish", sender: self)
        }
    }
    
    //Switching to Goal View (Weekly)
    @IBAction func toGoalViewWG1(_ sender: Any) {
        var index = 1 //Here we will find the status value for chosen weekly goal 1
        
        if (index == 1) {
            self.performSegue(withIdentifier: "toWeeklyGoalViewStart", sender: self)
        }
        else if (index == 2) {
            self.performSegue(withIdentifier: "toWeeklyGoalViewOngoing", sender: self)
        }
        else if (index == 3 || index == 4) {
            self.performSegue(withIdentifier: "toWeeklyGoalViewFinish", sender: self)
        }
    }
    
    @IBAction func toGoalViewWG2(_ sender: Any) {
        var index = 2 //Here we will find the status value for chosen weekly goal 1
        
        if (index == 1) {
            self.performSegue(withIdentifier: "toWeeklyGoalViewStart", sender: self)
        }
        else if (index == 2) {
            self.performSegue(withIdentifier: "toWeeklyGoalViewOngoing", sender: self)
        }
        else if (index == 3 || index == 4) {
            self.performSegue(withIdentifier: "toWeeklyGoalViewFinish", sender: self)
        }
    }
    
    @IBAction func toGoalViewWG3(_ sender: Any) {
        var index = 3 //Here we will find the status value for chosen weekly goal 1
        
        if (index == 1) {
            self.performSegue(withIdentifier: "toWeeklyGoalViewStart", sender: self)
        }
        else if (index == 2) {
            self.performSegue(withIdentifier: "toWeeklyGoalViewOngoing", sender: self)
        }
        else if (index == 3 || index == 4) {
            self.performSegue(withIdentifier: "toWeeklyGoalViewFinish", sender: self)
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
