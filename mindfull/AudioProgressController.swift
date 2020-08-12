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
        let journeyVC: JourneyController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "JourneyVC") as! JourneyController
        if(fromJournal == true){
            journeyVC.audioCompleted()
        }
        self.performSegue(withIdentifier: "toGarden", sender: self)
    }
    
}
