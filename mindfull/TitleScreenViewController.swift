//
//  TitleScreenViewController.swift
//  mindfull
//
//  Created by Tyler Turek on 7/30/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class TitleScreenViewController: UIViewController {

    @IBOutlet weak var checkUsername: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //Working on saving the username
       
        
        let username = LoginViewController().getUsername()
        checkUsername.text = "You are logged in as \(username)"
    }
    
    @IBAction func switchToOnboarding(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        let onboardingVC = storyboard.instantiateViewController(withIdentifier: "loginStoryBoard")
        self.present(onboardingVC, animated: true, completion: nil)
    }
 
}
