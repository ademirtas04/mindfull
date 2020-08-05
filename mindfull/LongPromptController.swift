//
//  LongPromptController.swift
//  mindfull
//
//  Created by Alp Demirtas on 8/4/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class LongPromptController: UIViewController {
    var promptTitle: String = ""
    var timer = Timer()
    @IBOutlet weak var Prompt: UILabel!
    @IBOutlet weak var responseShort: UITextField!
    @IBOutlet weak var responseLong: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
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
        let gardenVC: GardenController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "gardenVC") as! GardenController
        gardenVC.ResponseList.insert(responseShort.text!, at: 0)
        
        self.performSegue(withIdentifier: "toJournal", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toJournal") {
            let journalVC = segue.destination as! JournalController
            journalVC.addLine(line: promptTitle)
            journalVC.addLine(line: responseShort.text!)
            journalVC.addChunk(chunk: responseLong.text!)
        }
    }
    
    

}
