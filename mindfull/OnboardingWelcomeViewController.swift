//
//  OnboardingWelcomeViewController.swift
//  mindfull
//
//  Created by Tyler Turek on 7/29/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class OnboardingWelcomeViewController: UIViewController {
    
    var tempUsername = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toQuiz", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! QuizViewController
        vc.tempUsername2 = self.tempUsername
    }
    
}
