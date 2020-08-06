//
//  QuizViewController.swift
//  mindfull
//
//  Created by Tyler Turek on 7/29/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var slider1: UISlider!
    
    @IBOutlet weak var slider2: UISlider!
    
    @IBOutlet weak var slider3: UISlider!
    
    @IBOutlet weak var slider4: UISlider!
    
    @IBOutlet weak var slider5: UISlider!
    
    var tempUsername2 = ""

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueButton (_ sender: Any) {
         self.performSegue(withIdentifier: "goToMain", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! TitleScreenViewController
        vc.username = self.tempUsername2
    }
}

