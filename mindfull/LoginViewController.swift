//
//  LoginViewController.swift
//  mindfull
//
//  Created by Tyler Turek on 7/29/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var username = ""
    
    @IBOutlet weak var enterName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButton(_ sender: Any) {
        username = enterName.text ?? ""
        UserDefaults.standard.set(username, forKey: "username")
        
        self.performSegue(withIdentifier: "toWelcome", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! OnboardingWelcomeViewController
        vc.tempUsername = username
    }
    
}
