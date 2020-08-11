//
//  JourneyController.swift
//  mindfull
//
//  Created by Alp Demirtas on 7/23/20.
//  Copyright © 2020 Alp Demirtas.    All rights reserved.
//

import UIKit

class JourneyController: UIViewController {

    
    
    @IBOutlet weak var audioButton: UIButton!
    @IBOutlet weak var selfButton: UIButton!
    @IBOutlet weak var writtenButton: UIButton!
    
    @IBOutlet weak var environmentButton: UIButton!
    
    @IBOutlet weak var progress: UIProgressView!
    
    var audioList: [Goal] = []
    var assessList: [Goal] = []
    var writtenList: [Goal] = []
    var environmentList: [Goal] = []
    
    
    var audioIndex: Int = 0
    var assessmentIndex: Int = 0
    var writtenIndex: Int = 0
    var environmentIndex: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func audioPressed(_ sender: Any) {
    }
    
    
    @IBAction func assessmentPressed(_ sender: Any) {
    }
    
    @IBAction func writtenPressed(_ sender: Any) {
    }
    
    @IBAction func environmentPressed(_ sender: Any) {
    }
    
    
    @IBAction func goToGarden(_ sender: Any) {
        self.performSegue(withIdentifier: "toGarden", sender: self)
    }
    
    @IBAction func goToGoals(_ sender: Any) {
        self.performSegue(withIdentifier: "toGoals", sender: self)
    }
    
    
}
