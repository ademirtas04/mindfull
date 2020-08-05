//
//  GardenController.swift
//  mindfull
//
//  Created by Alp Demirtas on 7/26/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class GardenController: UIViewController {
    var screenTimer: Timer?
    var ResponseList: [String] = []
    
    var isRed:Bool = false
    var isBlue:Bool = true
    var isGreen: Bool = false
    var isOrange: Bool = false
    var isPurple: Bool = true
    
    var isBird: Bool = false
    var isBreeze: Bool = true
    var isWater: Bool = false
    var isWaves: Bool = false
    var isLeaves: Bool = true
    
    var redUnlocked: Bool = false
    var blueUnlocked: Bool = true
    var greenUnlocked: Bool = false
    var orangeUnlocked: Bool = false
    var purpleUnlocked: Bool = false
    
    var birdUnlocked: Bool = false
    var breezeUnlocked: Bool = true
    var waterUnlocked: Bool = true
    var wavesUnlocked: Bool = false
    var leavesUnlocked: Bool = false

    @IBOutlet weak var bgImage: UIImageView!
    static var coins: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if(isBird){
            AudioPlayer.shared.addBirds()
        }
        if(isBreeze){
            AudioPlayer.shared.addBreeze()
        }
        if(isWater){
            AudioPlayer.shared.addWater()
        }
        if(isWaves){
            AudioPlayer.shared.addWaves()
        }
        if(isLeaves){
            AudioPlayer.shared.addLeaves()
        }
        AudioPlayer.shared.startBackgroundMusic()
        screenTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(popUp), userInfo: nil, repeats: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        screenTimer?.invalidate()
        AudioPlayer.shared.stopBackgroundMusic()
    }
    
    @objc func popUp(){
        let screenWidth: Int = Int(Float(self.view!.bounds.width))
        let screenHeight: Int = Int(Float(self.view!.bounds.height))
        var img: UIImage? = UIImage(named: "tree5")
        self.bgImage.image = img
        self.bgImage.frame = CGRect(x: Int.random(in: 0...screenWidth), y: Int.random(in: 0...screenHeight), width: Int(Float(img!.size.width)), height: Int(Float(img!.size.height)))
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */    
    
    @IBAction func goToCustomizable(_ sender: Any) {
        self.performSegue(withIdentifier: "toCustomize", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "toCustomize"){
            let customizeVC = segue.destination as! CustomizeController
            customizeVC.redUnlocked = redUnlocked
            customizeVC.blueUnlocked = blueUnlocked
            customizeVC.greenUnlocked = greenUnlocked
            customizeVC.orangeUnlocked = orangeUnlocked
            customizeVC.purpleUnlocked = purpleUnlocked
            customizeVC.birdUnlocked = birdUnlocked
            customizeVC.breezeUnlocked = breezeUnlocked
            customizeVC.wavesUnlocked = wavesUnlocked
            customizeVC.leavesUnlocked = leavesUnlocked
            customizeVC.waterUnlocked = waterUnlocked
            customizeVC.usingRed = isRed
            customizeVC.usingBlue = isBlue
            customizeVC.usingGreen = isGreen
            customizeVC.usingOrange = isOrange
            customizeVC.usingPurple = isPurple
            customizeVC.usingBird = isBird
            customizeVC.usingBreeze = isBreeze
            customizeVC.usingWater = isWater
            customizeVC.usingWaves = isWaves
            customizeVC.usingLeaves = isLeaves
        }
        
    }
    static func addCoins(c: Int){
        coins = coins + c
    }
}
