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
        self.performSegue(withIdentifier: "toJournal", sender: self)
        let customizeVC: CustomizeController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "customizeVC") as! CustomizeController
        customizeVC.responseList.insert(responseShort.text!, at: 0)
    }
    
    

}
