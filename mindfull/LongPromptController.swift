//
//  LongPromptController.swift
//  mindfull
//
//  Created by Alp Demirtas on 8/4/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class LongPromptController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    var promptTitle: String = ""
    var timer = Timer()
    var fromJournal: Bool = false
    @IBOutlet weak var Prompt: UILabel!
    @IBOutlet weak var responseShort: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var responseLong: UITextView!
    
    
    
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
        gardenVC.addResponse(entry: responseShort.text!)
        
        self.performSegue(withIdentifier: "toJournal", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toJournal") {
            let journalVC = segue.destination as! JournalController
            let body: String = responseShort.text! + "\n" + responseLong.text!
            let e: Entry = Entry(prompt: promptTitle, body: body)
            journalVC.journalList.insert(e, at: 0)
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
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        scrollView.setContentOffset(CGPoint(x: 0,y: 250), animated: true)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    

}
