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
    var isPaused: Bool = true
    var timer = Timer()
    var totalTime: Float = 0
    var name: String = ""
    var fromJournal: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func playPressed(_ sender: Any) {
        if(isPaused){
            let pausedImage: UIImage? = UIImage(named: "pause")
            playButton.setImage(pausedImage, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(update), userInfo: nil, repeats: true)
            isPaused = false
        } else {
            let playImage: UIImage? = UIImage(named: "play")
            playButton.setImage(playImage, for: .normal)
            AudioPlayer.shared.stopBackgroundMusic()
            timer.invalidate()
            isPaused = true
        }
    }
    
    @objc func update() {
        if(!AudioPlayer.shared.isPlaying()){
            AudioPlayer.shared.startBackgroundMusic(forResource: name, ofType: "mp3")
        }  else {
            timer.invalidate()
        }
        var increment = 0.5 / totalTime
        progress.progress += increment
    }
    

}
