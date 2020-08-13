//
//  JournalController.swift
//  mindfull
//
//  Created by Alp Demirtas on 8/4/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit
class JournalController: UIViewController {

    var journalList = [Entry]()
    var currentDate: Date = Date()
    var entries: Int = 0
    var index: Int = 0
    
    @IBOutlet weak var dateTitle: UILabel!
    
    @IBOutlet weak var journalField: UITextView!
    
    var thisGoal = Goal(title: "", description: "", xpPoints: 0, status: 0)
       
    var goalIndex = 10
    
    //Origin tells us where we are coming from, 0 default to personalized goals, 1 from DGStart, 2 from DGOngoing, 3 from DGFinish, 4 from WGStart, 5 from WGOngoing and 6 from WGFinish
    var origin = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        decodeArray()
        if(journalList.count != 0){
            let date: Date = journalList[0].date
            currentDate = date
            let calendar = Calendar.current
            let dd = calendar.component(.day, from: date)
            let MM = calendar.component(.month, from: date)
            let yyyy = calendar.component(.year, from: date)
            dateTitle.text = "\(dd)/\(MM)/\(yyyy)"
            entries = 0
            for entry in journalList {
                let d: Date = entry.date
                let calendar = Calendar.current
                let DD = calendar.component(.day, from: d)
                let mm = calendar.component(.month, from: d)
                let YYYY = calendar.component(.year, from: d)
                if(dd == DD && MM == mm && yyyy == YYYY){
                    let min = calendar.component(.minute, from: date)
                    let hour = calendar.component(.hour, from: date)
                    journalField.text = journalField.text + "\n" + "\(hour):\(min)" + "\n" + entry.prompt + "\n" + entry.body
                    entries = entries + 1
                }
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    @IBAction func leftPressed(_ sender: Any) {
        if(index != 0){
            index = index - 1
            let date: Date = journalList[index].date
            let calendar = Calendar.current
            let dd = calendar.component(.day, from: date)
            let MM = calendar.component(.month, from: date)
            let yyyy = calendar.component(.year, from: date)
            dateTitle.text = "\(dd)/\(MM)/\(yyyy)"
            entries = 0
            
            for entry in journalList {
                entries = 0
                let d: Date = entry.date
                let calendar = Calendar.current
                let DD = calendar.component(.day, from: d)
                let mm = calendar.component(.month, from: d)
                let YYYY = calendar.component(.year, from: d)
                if(dd == DD && MM == mm && yyyy == YYYY){
                    let min = calendar.component(.minute, from: date)
                    let hour = calendar.component(.hour, from: date)
                    journalField.text = journalField.text + "\n" + "\(hour):\(min)" + "\n" + entry.prompt + "\n" + entry.body
                    entries = entries + 1
                }
            }
        }
    }
    
    
    @IBAction func rightPressed(_ sender: Any) {
        if(index + entries < journalList.count){
            index = index + entries
            let date: Date = journalList[index].date
            let calendar = Calendar.current
            let dd = calendar.component(.day, from: date)
            let MM = calendar.component(.month, from: date)
            let yyyy = calendar.component(.year, from: date)
            dateTitle.text = "\(dd)/\(MM)/\(yyyy)"
            entries = 0
            
            for entry in journalList {
                entries = 0
                let d: Date = entry.date
                let calendar = Calendar.current
                let DD = calendar.component(.day, from: d)
                let mm = calendar.component(.month, from: d)
                let YYYY = calendar.component(.year, from: d)
                if(dd == DD && MM == mm && yyyy == YYYY){
                    let min = calendar.component(.minute, from: date)
                    let hour = calendar.component(.hour, from: date)
                    journalField.text = journalField.text + "\n" + "\(hour):\(min)" + "\n" + entry.prompt + "\n" + entry.body
                    entries = entries + 1
                }
            }
        }
        
    }
    
    @IBAction func goToGarden(_ sender: Any) {
        encodeArray()
        
        if origin == 0 {
            self.performSegue(withIdentifier: "toGarden", sender: self)
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
    
    func decodeArray(){
        var count: Int = 0
        var body: String = ""
        var prompt: String = ""
        var date: Date = Date()
        if let x = UserDefaults.standard.object(forKey: "count") as? Int{
            count = x
        }
        if count != 0 {
            for n in 0 ... count - 1 {
                if let x = UserDefaults.standard.object(forKey: "body\(n)") as? String{
                    body = x
                }
                if let x = UserDefaults.standard.object(forKey: "prompt\(n)") as? String{
                    prompt = x
                }
                if let x = UserDefaults.standard.object(forKey: "date\(n)") as? Date{
                    date = x
                }
                let e: Entry = Entry(prompt: prompt, body: body, date: date)
                journalList.append(e)
                
            }
        }
    }
    
    func encodeArray(){
        for n in 0...journalList.count - 1 {
            let e: Entry = journalList[n]
            UserDefaults.standard.set(e.body, forKey: "body\(n)")
            UserDefaults.standard.set(e.prompt, forKey: "prompt\(n)")
            UserDefaults.standard.set(e.date, forKey: "date\(n)")
        }
        UserDefaults.standard.set(journalList.count, forKey: "count")
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
}
