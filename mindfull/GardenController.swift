//
//  GardenController.swift
//  mindfull
//
//  Created by Alp Demirtas on 7/26/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit
import SpriteKit

class GardenController: UIViewController {
        
    @IBOutlet weak var uiview: UIView!
    
    @IBOutlet weak var affirmation1: UILabel!
    @IBOutlet weak var affirmation2: UILabel!
    @IBOutlet weak var affirmation3: UILabel!
    @IBOutlet weak var affirmation4: UILabel!
    @IBOutlet weak var affirmation5: UILabel!
    
    var screenTimer: Timer?
    var ResponseList: [String] = ["compassion", "peace", "strength", "tranquility", "energy"]
    
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
        showWords()
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
        let sk: SKView = SKView()
        sk.frame = uiview.bounds
        sk.backgroundColor = .clear
        uiview.addSubview(sk)

        let scene: SKScene = SKScene(size: uiview.bounds.size)
        scene.scaleMode = .aspectFit
        scene.backgroundColor = .clear
        if(isRed){
            let en1 = SKEmitterNode(fileNamed: "red.sks")
            en1?.position = CGPoint(x: Int.random(in: 0...screenWidth), y: Int.random(in: 0...screenHeight))
            scene.addChild(en1!)
        }
        if(isBlue){
            let en2 = SKEmitterNode(fileNamed: "blue.sks")
            en2?.position = CGPoint(x: Int.random(in: 0...screenWidth), y: Int.random(in: 0...screenHeight))
            scene.addChild(en2!)
        }
        if(isGreen){
            let en3 = SKEmitterNode(fileNamed: "green.sks")
            en3?.position = CGPoint(x: Int.random(in: 0...screenWidth), y: Int.random(in: 0...screenHeight))
            scene.addChild(en3!)
        }
        if(isOrange){
            let en4 = SKEmitterNode(fileNamed: "orange.sks")
            en4?.position = CGPoint(x: Int.random(in: 0...screenWidth), y: Int.random(in: 0...screenHeight))
            scene.addChild(en4!)
        }
        if(isPurple){
            let en5 = SKEmitterNode(fileNamed: "purple.sks")
            en5?.position = CGPoint(x: Int.random(in: 0...screenWidth), y: Int.random(in: 0...screenHeight))
            scene.addChild(en5!)
        }
        
        sk.presentScene(scene)
        /*
        var img: UIImage? = UIImage(named: "tree5")
        self.bgImage.image = img
        self.bgImage.frame = CGRect(x: Int.random(in: 0...screenWidth), y: Int.random(in: 0...screenHeight), width: Int(Float(img!.size.width)), height: Int(Float(img!.size.height)))
        */
    }
    
    func showWords(){
        if(!(ResponseList.count == 0)){
            if(ResponseList.count == 1){
                
            } else if (ResponseList.count == 2){
                
            } else if (ResponseList.count == 3){
                
            } else if (ResponseList.count == 4){
                
            } else {
                
            }
            
        }
    }
    
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
