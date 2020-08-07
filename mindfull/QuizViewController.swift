//
//  QuizViewController.swift
//  mindfull
//
//  Created by Tyler Turek on 7/29/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var slider3: UISlider!
    @IBOutlet weak var slider4: UISlider!
    @IBOutlet weak var slider5: UISlider!
    
    @IBOutlet weak var slider1Label: UILabel!
    @IBOutlet weak var slider2Label: UILabel!
    @IBOutlet weak var slider3Label: UILabel!
    @IBOutlet weak var slider4Label: UILabel!
    @IBOutlet weak var slider5Label: UILabel!
    
    var tempUsername2 = ""
    
    //The sliders
    @IBAction func moveSlider1(_ sender: UISlider) {
        let value = Int(sender.value)
        slider1Label.text = String(value)
    }
    
    @IBAction func moveSlider2(_ sender: UISlider) {
        let value = Int(sender.value)
        slider2Label.text = String(value)
    }
    
    @IBAction func moveSlider3(_ sender: UISlider) {
        let value = Int(sender.value)
        slider3Label.text = String(value)
    }
    
    @IBAction func moveSlider4(_ sender: UISlider) {
        let value = Int(sender.value)
        slider4Label.text = String(value)
    }
    
    @IBAction func moveSlider5(_ sender: UISlider) {
        let value = Int(sender.value)
        slider5Label.text = String(value)
    }
    
    @IBAction func continueButton (_ sender: Any) {
         self.performSegue(withIdentifier: "goToMain", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! TitleScreenViewController
        vc.username = self.tempUsername2
    }
}

