//
//  LongPromptController.swift
//  mindfull
//
//  Created by Alp Demirtas on 8/4/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class LongPromptController: UIViewController, UITextFieldDelegate {
    var promptTitle: String = ""
    var timer = Timer()
    var fromJournal: Bool = false
    @IBOutlet weak var Prompt: UILabel!
    @IBOutlet weak var responseShort: UITextField!
    @IBOutlet weak var responseLong: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var thisGoal = Goal(title: "", description: "", xpPoints: 0, status: 0)
       
    var goalIndex = 10
    
    //Origin tells us where we are coming from, 0 default to personalized goals, 1 from DGStart, 2 from DGOngoing, 3 from DGFinish, 4 from WGStart, 5 from WGOngoing and 6 from WGFinish
    var origin = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Prompt.text = promptTitle
        doneButton.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(check), userInfo: nil, repeats: true)
    }
    
    @objc func check(){
        if(doneButton.isHidden){
            if(!(responseShort.text == "") && !(responseLong.text == "")){
                doneButton.isHidden = false
            }
        } else {
            timer.invalidate()
        }
    }
    
    func setPrompt(prompt: String){
        self.promptTitle = prompt
    }
    
    @IBAction func goToJournal(_ sender: Any) {
        if origin == 0 {
                let gardenVC: GardenController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "gardenVC") as! GardenController
                gardenVC.addResponse(entry: responseShort.text!)
                
                self.performSegue(withIdentifier: "toJournal", sender: self)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toJournal") {
            let journalVC = segue.destination as! JournalController
            let body: String = responseShort.text! + "\n" + responseLong.text!
            let e: Entry = Entry(prompt: promptTitle, body: body)
            journalVC.journalList.insert(e, at: 0)
        }
        else if origin == 1 {
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        responseLong.resignFirstResponder()
        responseShort.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField != responseShort){
            scrollView.setContentOffset(CGPoint(x: 0,y: 250), animated: true)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    

}
