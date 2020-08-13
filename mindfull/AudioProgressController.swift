//
//  AudioProgressController.swift
//  mindfull
//
//  Created by Alp Demirtas on 8/4/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class AudioProgressController: UIViewController {
    
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var doneButton: UIButton!
    
    var isPaused: Bool = true
    var timer = Timer()
    var totalTime: Float = 0
    var name: String = ""
    var fromJournal: Bool = false
    
    var thisGoal = Goal(title: "", description: "", xpPoints: 0, status: 0)
       
    var goalIndex = 10
    
    //Origin tells us where we are coming from, 0 default to personalized goals, 1 from DGStart, 2 from DGOngoing, 3 from DGFinish, 4 from WGStart, 5 from WGOngoing and 6 from WGFinish
    var origin = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        doneButton.isHidden = true
        AudioPlayer.shared.stopBackgroundMusic()
        totalTime = AudioPlayer.shared.musicLength(name: name, ofType: "mp3")
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }

    @IBAction func playPressed(_ sender: Any) {
        if(isPaused){
            let pausedImage: UIImage? = UIImage(named: "pause")
            playButton.setImage(pausedImage, for: .normal)
            AudioPlayer.shared.startBackgroundMusic(name: name, ofType: "mp3")
            isPaused = false
        } else {
            let playImage: UIImage? = UIImage(named: "play")
            playButton.setImage(playImage, for: .normal)
            AudioPlayer.shared.stopBackgroundMusic()
            isPaused = true
        }
    }
    
    @objc func update() {
        if(AudioPlayer.shared.isPlaying()){
            progress.progress += 0.5/totalTime
        }
        if(progress.progress == 1) {
            doneButton.isHidden = false
        }
    }
    
    @IBAction func donePressed(_ sender: Any) {
        if origin == 0 {
            let journeyVC: JourneyController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "JourneyVC") as! JourneyController
            if(fromJournal == true){
                journeyVC.audioCompleted()
            }
            self.performSegue(withIdentifier: "toGarden", sender: self)
        }
        else if origin == 1 {
            self.performSegue(withIdentifier: "toDG1", sender: self)
        }
        else if origin == 2 {
            self.performSegue(withIdentifier: "toDG2", sender: self)
        }
        else if origin == 3 {
            self.performSegue(withIdentifier: "toDG3", sender: self)
        }
        else if origin == 4 {
            self.performSegue(withIdentifier: "toWG1", sender: self)
        }
        else if origin == 5 {
            self.performSegue(withIdentifier: "toWG2", sender: self)
        }
        else if origin == 6 {
            self.performSegue(withIdentifier: "toWG3", sender: self)
        }
    }
    //To pass information back to where we came from
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if origin == 1 {
            let vc = segue.destination as! DailyGoalViewStartViewController
            vc.goalIndex = goalIndex
            vc.thisGoal = thisGoal
        }
        else if origin == 2 {
            let vc = segue.destination as! DailyGoalViewOngoingViewController
            vc.goalIndex = goalIndex
            vc.thisGoal = thisGoal
        }
        else if origin == 3 {
            let vc = segue.destination as! DailyGoalViewFinishViewController
            vc.goalIndex = goalIndex
            vc.thisGoal = thisGoal
        }
        else if origin == 4 {
            let vc = segue.destination as! WeeklyGoalViewStartViewController
            vc.goalIndex = goalIndex
            vc.thisGoal = thisGoal
        }
        else if origin == 5 {
            let vc = segue.destination as! WeeklyGoalViewOngoingViewController
            vc.goalIndex = goalIndex
            vc.thisGoal = thisGoal
        }
        else if origin == 6 {
            let vc = segue.destination as! WeeklyGoalViewFinishViewController
            vc.goalIndex = goalIndex
            vc.thisGoal = thisGoal
        }
    }
}
