//
//  EIEntryViewController.swift
//  mindfull
//
//  Created by Tyler Turek on 8/10/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class EIEntryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Starting - Everytime this view is loaded
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getData()
    }
    
    //Instance Variables
    var EIJournal: [EIEntry] = []
    
    var thisEntry = EIEntry(date: "", exercise: "", time: "", whatTheySaw: "", whatTheyTouched: "", whatTheyHeard: "", whatTheySmelled: "", emotions: "")
    
    @IBOutlet weak var exerciseTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var seeTextField: UITextField!
    @IBOutlet weak var touchTextField: UITextField!
    @IBOutlet weak var hearTextField: UITextField!
    @IBOutlet weak var smellTextField: UITextField!
    @IBOutlet weak var feelTextField: UITextField!
    
    let calendar = Calendar.current
    
    //Switching to EIJournal
    @IBAction func toJournal(_ sender: Any) {
        saveData()
        
        self.performSegue(withIdentifier: "toEIJournal", sender: self)
    }
    
    //When the player is done doing an entry
    @IBAction func done(_ sender: Any) {
        let rightNow = Date()
        let rightNowYear = calendar.dateComponents([.year], from: rightNow).year!
        let rightNowMonth = calendar.dateComponents([.month], from: rightNow).month!
        let rightNowDay = calendar.dateComponents([.day], from: rightNow).day!
        let monthString = convertToMonth(month: rightNowMonth)
        let theDate = "\(monthString) \(rightNowDay), \(rightNowYear)"
        thisEntry.setDate(newDate: theDate)
        thisEntry.setExercise(newExercise: exerciseTextField.text ?? "")
        thisEntry.setTime(newTime: timeTextField.text ?? "")
        thisEntry.setWhatTheySaw(newWhatTheySaw: seeTextField.text ?? "")
        thisEntry.setWhatTheyTouched(newWhatTheyTouched: touchTextField.text ?? "")
        thisEntry.setWhatTheyHeard(newWhatTheyHeard: hearTextField.text ?? "")
        thisEntry.setWhatTheySmelled(newWhatTheySmelled: smellTextField.text ?? "")
        thisEntry.setEmotions(newEmotions: feelTextField.text ?? "")
        
        EIJournal.append(thisEntry)
        
        saveData()
        
        self.performSegue(withIdentifier: "toEIJournal", sender: self)
        //Switch back to the enviormental goal screen which is not ready cause of Benny
    }
    
    //When the player cancels creating a new entry
    @IBAction func cancel(_ sender: Any) {
        
        //Switch back to the enviormental goal screen which is not ready cause of Benny
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
    
    //Function to convert into month to sting month
    func convertToMonth(month: Int) -> String {
        if month == 1 {
            return "January"
        }
        else if month == 2 {
            return "February"
        }
        else if month == 3 {
            return "March"
        }
        else if month == 4 {
            return "April"
        }
        else if month == 5 {
            return "May"
        }
        else if month == 6 {
            return "June"
        }
        else if month == 7 {
            return "July"
        }
        else if month == 8 {
            return "August"
        }
        else if month == 9 {
            return "September"
        }
        else if month == 10 {
            return "October"
        }
        else if month == 11 {
            return "November"
        }
        else if month == 12 {
            return "December"
        }
        return "ERROR"
    }
}

class EIEntry: Codable {
    var creationDate = ""
    var exercise = ""
    var time = ""
    var whatTheySaw = ""
    var whatTheyTouched = ""
    var whatTheyHeard = ""
    var whatTheySmelled = ""
    var emotions = ""
    
    init(date: String, exercise: String, time: String, whatTheySaw: String, whatTheyTouched: String, whatTheyHeard: String, whatTheySmelled: String, emotions: String) {
        self.creationDate = date
        self.exercise = exercise
        self.time = time
        self.whatTheySaw = whatTheySaw
        self.whatTheyTouched = whatTheyTouched
        self.whatTheyHeard = whatTheyHeard
        self.whatTheySmelled = whatTheySmelled
    }
    
    func getDate() -> String {
        return creationDate
    }
    
    func getExercise() -> String {
        return exercise
    }
    
    func getTime() -> String {
        return time
    }
    
    func getWhatTheySaw() -> String {
        return whatTheySaw
    }
    
    func getWhatTheyTouched() -> String {
        return whatTheyTouched
    }
    
    func getWhatTheyHeard() -> String {
        return whatTheyHeard
    }
    
    func getWhatTheySmelled() -> String {
        return whatTheySmelled
    }
    
    func getEmotions() -> String {
        return emotions
    }
    
    func setDate(newDate: String) {
        creationDate = newDate
    }
    
    func setExercise(newExercise: String) {
        exercise = newExercise
    }
    
    func setTime(newTime: String) {
        time = newTime
    }
    
    func setWhatTheySaw(newWhatTheySaw: String) {
        whatTheySaw = newWhatTheySaw
    }
    
    func setWhatTheyTouched(newWhatTheyTouched: String) {
        whatTheyTouched = newWhatTheyTouched
    }
    
    func setWhatTheyHeard(newWhatTheyHeard: String) {
        whatTheyHeard = newWhatTheyHeard
    }
    
    func setWhatTheySmelled(newWhatTheySmelled: String) {
        whatTheySmelled = newWhatTheySmelled
    }
    
    func setEmotions(newEmotions: String) {
        emotions = newEmotions
    }
}