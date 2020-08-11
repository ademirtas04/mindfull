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
    
    var r: Resources = Resources()
    
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
        audioList = r.getAudioTrack()
        assessList = r.getAssessmentList()
        writtenList = r.getWrittenList()
        environmentList = r.getEnvironmentList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let x = UserDefaults.standard.object(forKey: "audioIndex")  as?  Int {
             audioIndex = x
         }
         if let x = UserDefaults.standard.object(forKey: "assessmentIndex")  as?  Int {
             assessmentIndex = x
         }
         if let x = UserDefaults.standard.object(forKey: "writtenIndex")  as?  Int {
             audioIndex = x
         }
         if let x = UserDefaults.standard.object(forKey: "environmentIndex")  as?  Int {
             audioIndex = x
         }
         audioButton.setTitle(audioList[audioIndex].getTitle(), for: .normal)
         selfButton.setTitle(assessList[assessmentIndex].getTitle(), for: .normal)
         writtenButton.setTitle(writtenList[audioIndex].getTitle(), for: .normal)
         environmentButton.setTitle("WORK IN PROGRESS", for: .normal)
        
    }
    
    @IBAction func audioPressed(_ sender: Any) {
    }
    
    
    @IBAction func assessmentPressed(_ sender: Any) {
    }
    
    @IBAction func writtenPressed(_ sender: Any) {
    }
    
    @IBAction func environmentPressed(_ sender: Any) {
    }
    
    func audioCompleted() {
        audioIndex += 1
        UserDefaults.standard.set(audioIndex, forKey: "audioIndex")
    }
    
    func assessmentCompleted() {
        assessmentIndex += 1
        UserDefaults.standard.set(assessmentIndex, forKey: "assessmentIndex")
    }
    
    func writtenCompleted() {
        writtenIndex += 1
        UserDefaults.standard.set(writtenIndex, forKey: "writtenIndex")
    }
    
    func environmentCompleted() {
        environmentIndex += 1
        UserDefaults.standard.set(environmentIndex, forKey: "environmentIndex")
    }
    
    @IBAction func goToGarden(_ sender: Any) {
        self.performSegue(withIdentifier: "toGarden", sender: self)
    }
    
    @IBAction func goToGoals(_ sender: Any) {
        self.performSegue(withIdentifier: "toGoals", sender: self)
    }
    
    
}
