//
//  ShortPromptController.swift
//  mindfull
//
//  Created by Alp Demirtas on 8/4/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class ShortPromptController: UIViewController {
    
    var timer = Timer()
    
    @IBOutlet weak var done: UIButton!
    var promptTitle: String = ""
    
    @IBOutlet weak var prompt: UILabel!
    
    @IBOutlet weak var response1: UITextField!
    
    @IBOutlet weak var response2: UITextField!
    
    
    @IBOutlet weak var response3: UITextField!
    
    
    @IBOutlet weak var response4: UITextField!
    
    
    @IBOutlet weak var response5: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prompt.text = promptTitle
        done.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(check), userInfo: nil, repeats: true)
    }
    
    func setPrompt(prompt: String){
        self.promptTitle = prompt
    }
    
    @objc func check(){
        if(done.isHidden){
            if(!(response1.text == ""  ) && !(response2.text == ""  ) && !(response3.text == ""  ) && !(response4.text == ""  ) && !(response5.text == ""  )){
                done.isHidden = false
            }
        } else {
            timer.invalidate()
        }
        
    }
    
    
    @IBAction func goToGarden(_ sender: Any) {
        let gardenVC: GardenController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "gardenVC") as! GardenController
        gardenVC.ResponseList.insert(response1.text!, at: 0)
        gardenVC.ResponseList.insert(response2.text!, at: 0)
        gardenVC.ResponseList.insert(response3.text!, at: 0)
        gardenVC.ResponseList.insert(response4.text!, at: 0)
        gardenVC.ResponseList.insert(response5.text!, at: 0)
        
        self.performSegue(withIdentifier: "toJournal", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toJournal"){
            let journalVC = segue.destination as! JournalController
            let body: String = response1.text! + "\n" + response2.text! + "\n" + response3.text! + "\n" + response4.text! + "\n" + response5.text!
            let e: Entry = Entry(prompt: promptTitle, body: body)
            journalVC.journalList.insert(e, at: 0)
        }
    }
    

    

}
