//
//  LoginViewController.swift
//  mindfull
//
//  Created by Tyler Turek on 7/29/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Working on saving the username
    
    var username: String = "[Username]"
    
    @IBOutlet weak var enterName: UITextField!
    
    @IBAction func nextButton(_ sender: Any) {
        username = enterName.text ?? ""
        
        self.performSegue(withIdentifier: "toWelcome", sender: self)
    }
    
    func getUsername() -> String {
        return username
    }
}
