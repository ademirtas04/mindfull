//
//  PGNewGoalViewController.swift
//  mindfull
//
//  Created by Tyler Turek on 8/5/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class PGNewGoalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createDatePickerView()
    }
    
    //Instance Variables
    var personalGoals: [personalGoal] = []
    
    var thisGoal = personalGoal(title: "", description: "", xpPoints: 0, status: 0, endTime: Date())
    
    var goalIndex = 0
    
    var goalsDoneToday = 0
    
    var cancel = false
    
    var specialStatus = false
    
    var specialStatusIndex = 0
    
    @IBOutlet weak var PGReward: UISlider!
    @IBOutlet weak var PGTitle: UITextField!
    @IBOutlet weak var PGRewardLabel: UILabel!
    @IBOutlet weak var PGDescription: UITextField!
    @IBOutlet weak var PGEndTime: UITextField!
    
    let datePicker = UIDatePicker()
    
    //The slider
    @IBAction func moveSlider(_ sender: UISlider) {
        let value = Int(sender.value)
        PGRewardLabel.text = "+\(String(value))xp"
    }
    
    //Date picker
    func createDatePickerView() {
        PGEndTime.textAlignment = .center
        PGEndTime.text = "Pick a Time"
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        PGEndTime.inputAccessoryView = toolbar
        PGEndTime.inputView = datePicker
        datePicker.datePickerMode = .dateAndTime
    }
    
    //Date picker label
    @objc func donePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
        PGEndTime.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    //Finish creating new goal - Not Finished
    @IBAction func finishGoal(_ sender: Any) {
        thisGoal.changeTitle(newTitle: PGTitle.text ?? "")
        thisGoal.changeDescription(newDescription: PGDescription.text ?? "")
        thisGoal.changeXPPoints(newXPPoints: Int(PGReward.value))
        thisGoal.changeEndTime(newEndTime: datePicker.date)
        thisGoal.changeStatus(newStatus: 2)
        goalsDoneToday = goalsDoneToday + 1
        
        self.performSegue(withIdentifier: "toPGHomeScreen", sender: self)
    }
    
    //Cancel creating new goal
    @IBAction func cancelGoal(_ sender: Any) {
        cancel = true
        self.performSegue(withIdentifier: "toPGHomeScreen", sender: self)
    }
    
    //To pass information back to the home screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! PGHomeScreenViewController
        if (cancel == false) {
            if (specialStatus == true) {
                personalGoals.remove(at: specialStatusIndex)
                personalGoals.insert(thisGoal, at: specialStatusIndex)
            }
            else {
                personalGoals.append(thisGoal)
            }
        }
        vc.personalGoals = personalGoals
        vc.goalsDoneToday = goalsDoneToday
        vc.fromLocalGroup = true
        vc.saveData()
    }
}
