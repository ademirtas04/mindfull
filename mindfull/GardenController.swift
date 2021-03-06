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
        
    @IBOutlet weak var customizeButton: UIButton!
    @IBOutlet weak var uiview: UIView!
    
    @IBOutlet weak var affirmation1: UILabel!
    @IBOutlet weak var affirmation2: UILabel!
    @IBOutlet weak var affirmation3: UILabel!
    @IBOutlet weak var affirmation4: UILabel!
    @IBOutlet weak var affirmation5: UILabel!
    var screenTimer: Timer?
    var ResponseList: [String] = []
    
    var isRed:Bool = false
    var isBlue:Bool = false
    var isGreen: Bool = false
    var isOrange: Bool = false
    var isPurple: Bool = false
    
    var isBird: Bool = false
    var isBreeze: Bool = false
    var isWater: Bool = false
    var isWaves: Bool = false
    var isLeaves: Bool = false
    
    var redUnlocked: Bool = true
    var blueUnlocked: Bool = true
    var greenUnlocked: Bool = true
    var orangeUnlocked: Bool = true
    var purpleUnlocked: Bool = true
    
    var birdUnlocked: Bool = true
    var breezeUnlocked: Bool = true
    var waterUnlocked: Bool = true
    var wavesUnlocked: Bool = true
    var leavesUnlocked: Bool = true

    @IBOutlet weak var bgImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customizeButton.showsTouchWhenHighlighted = true
        if let x = UserDefaults.standard.object(forKey: "responseList") as? [String]{
            ResponseList = x
        }
        
        if(XPBar.shared.unlockedAudio() == 0) {
            birdUnlocked = false
            breezeUnlocked = false
            waterUnlocked = false
            wavesUnlocked = false
            leavesUnlocked = false
        } else if(XPBar.shared.unlockedAudio() == 1) {
            birdUnlocked = true
            breezeUnlocked = false
            waterUnlocked = false
            wavesUnlocked = false
            leavesUnlocked = false
        }  else if(XPBar.shared.unlockedAudio() == 2) {
            birdUnlocked = true
            breezeUnlocked = true
            waterUnlocked = false
            wavesUnlocked = false
            leavesUnlocked = false
        } else if(XPBar.shared.unlockedAudio() == 3) {
            birdUnlocked = true
            breezeUnlocked = true
            waterUnlocked = true
            wavesUnlocked = false
            leavesUnlocked = false
        } else if(XPBar.shared.unlockedAudio() == 4) {
            birdUnlocked = true
            breezeUnlocked = true
            waterUnlocked = true
            wavesUnlocked = true
            leavesUnlocked = false
        } else if(XPBar.shared.unlockedAudio() == 5) {
            birdUnlocked = true
            breezeUnlocked = true
            waterUnlocked = true
            wavesUnlocked = true
            leavesUnlocked = true
        }
        
        if(XPBar.shared.unlockedAssessment() == 0) {
            redUnlocked = false
            blueUnlocked = false
            greenUnlocked = false
            orangeUnlocked = false
            purpleUnlocked = false
        } else if(XPBar.shared.unlockedAssessment() == 1) {
            redUnlocked = true
            blueUnlocked = false
            greenUnlocked = false
            orangeUnlocked = false
            purpleUnlocked = false
        }  else if(XPBar.shared.unlockedAssessment() == 2) {
            redUnlocked = true
            blueUnlocked = true
            greenUnlocked = false
            orangeUnlocked = false
            purpleUnlocked = false
        } else if(XPBar.shared.unlockedAssessment() == 3) {
            redUnlocked = true
            blueUnlocked = true
            greenUnlocked = true
            orangeUnlocked = false
            purpleUnlocked = false
        } else if(XPBar.shared.unlockedAssessment() == 4) {
            redUnlocked = true
            blueUnlocked = true
            greenUnlocked = true
            orangeUnlocked = true
            purpleUnlocked = false
        } else if(XPBar.shared.unlockedAssessment() == 5) {
            redUnlocked = true
            blueUnlocked = true
            greenUnlocked = true
            orangeUnlocked = true
            purpleUnlocked = true
        }
        
        if(redUnlocked == true) {
            isRed = true
        }
        
        if(blueUnlocked == true) {
            isBlue = true
        }
        
        if(greenUnlocked == true){
            isGreen = true
        }
        
        if(orangeUnlocked == true) {
            isOrange = true
        }
        
        if(purpleUnlocked == true){
            isPurple = true
        }
        
        if(birdUnlocked == true){
            isBird = true
        }
        
        if(breezeUnlocked == true){
            isBreeze = true
        }
        
        if(waterUnlocked == true){
            isWater = true
        }
        
        if(wavesUnlocked == true){
            isWaves = true
        }
        
        if(leavesUnlocked == true) {
            isLeaves = true
        }
        
        
        if let x = UserDefaults.standard.object(forKey: "red")  as?  Bool {
            isRed = x
        }
        if let x = UserDefaults.standard.object(forKey: "blue")  as?  Bool {
            isBlue = x
        }
        if let x = UserDefaults.standard.object(forKey: "green")  as?  Bool {
            isGreen = x
        }
        if let x = UserDefaults.standard.object(forKey: "orange")  as?  Bool {
            isOrange = x
        }
        if let x = UserDefaults.standard.object(forKey: "purple")  as?  Bool {
            isPurple = x
        }
        if let x = UserDefaults.standard.object(forKey: "bird")  as?  Bool {
            isBird = x
        }
        if let x = UserDefaults.standard.object(forKey: "breeze")  as?  Bool {
            isBreeze = x
        }
        if let x = UserDefaults.standard.object(forKey: "leaves")  as?  Bool {
            isLeaves = x
        }
        if let x = UserDefaults.standard.object(forKey: "waves")  as?  Bool {
            isWaves = x
        }
        if let x = UserDefaults.standard.object(forKey: "water")  as?  Bool {
            isWater = x
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showWords()
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
        UserDefaults.standard.set(isRed, forKey: "red")
        UserDefaults.standard.set(isBlue, forKey: "blue")
        UserDefaults.standard.set(isGreen, forKey: "green")
        UserDefaults.standard.set(isOrange, forKey: "orange")
        UserDefaults.standard.set(isPurple, forKey: "purple")
        UserDefaults.standard.set(isBird, forKey: "bird")
        UserDefaults.standard.set(isBreeze, forKey: "breeze")
        UserDefaults.standard.set(isWater, forKey: "water")
        UserDefaults.standard.set(isWaves, forKey: "waves")
        UserDefaults.standard.set(isLeaves, forKey: "leaves")
        UserDefaults.standard.set(redUnlocked, forKey: "redUnlocked")
        UserDefaults.standard.set(blueUnlocked, forKey: "blueUnlocked")
        UserDefaults.standard.set(greenUnlocked, forKey: "greenUnlocked")
        UserDefaults.standard.set(orangeUnlocked, forKey: "orangeUnlocked")
        UserDefaults.standard.set(purpleUnlocked, forKey: "purpleUnlocked")
        UserDefaults.standard.set(birdUnlocked, forKey: "birdUnlocked")
        UserDefaults.standard.set(breezeUnlocked, forKey: "breezeUnlocked")
        UserDefaults.standard.set(waterUnlocked, forKey: "waterUnlocked")
        UserDefaults.standard.set(wavesUnlocked, forKey: "wavesUnlocked")
        UserDefaults.standard.set(leavesUnlocked, forKey: "leavesUnlocked")
        
        super.viewWillDisappear(animated)
        screenTimer?.invalidate()
        AudioPlayer.shared.stopBackgroundMusic()
    }
    
    @objc func popUp(){
        let screenWidth: Int = Int(Float(self.view!.bounds.width))
        let screenHeight: Int = Int(Float(self.view!.bounds.height))
        let sk: SKView = SKView()
        sk.frame = CGRect(x: 0, y: 65, width: self.view!.frame.width, height: self.view!.frame.height - 65 - 84)
        sk.backgroundColor = .clear
        uiview.addSubview(sk)

        let scene: SKScene = SKScene(size: CGSize(width: self.view!.frame.width, height: self.view!.frame.height - 65 - 84))
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
        let screenWidth: Int = Int(Float(self.view!.bounds.width))
        let screenHeight: Int = Int(Float(self.view!.bounds.height))
        if(!(ResponseList.count == 0)){
            if(ResponseList.count == 1){
                affirmation1.text = ResponseList[0]
                affirmation2.text = ""
                affirmation3.text = ""
                affirmation4.text = ""
                affirmation5.text = ""
            } else if (ResponseList.count == 2){
                affirmation1.text = ResponseList[0]
                affirmation2.text = ResponseList[1]
                affirmation3.text = ""
                affirmation4.text = ""
                affirmation5.text = ""
            } else if (ResponseList.count == 3){
                affirmation1.text = ResponseList[0]
                affirmation2.text = ResponseList[1]
                affirmation3.text = ResponseList[2]
                affirmation4.text = ""
                affirmation5.text = ""
            } else if (ResponseList.count == 4){
                affirmation1.text = ResponseList[0]
                affirmation2.text = ResponseList[1]
                affirmation3.text = ResponseList[2]
                affirmation4.text = ResponseList[3]
                affirmation5.text = ""
            } else {
                var temp = ResponseList
                var random: Int = Int.random(in: 0...temp.count - 1)
                affirmation1.text = temp[random]
                temp.remove(at: random)
                random = Int.random(in: 0...temp.count - 1)
                affirmation2.text = temp[random]
                temp.remove(at: random)
                random = Int.random(in: 0...temp.count - 1)
                affirmation3.text = temp[random]
                temp.remove(at: random)
                random = Int.random(in: 0...temp.count - 1)
                affirmation4.text = temp[random]
                temp.remove(at: random)
                random = Int.random(in: 0...temp.count - 1)
                affirmation5.text = temp[random]
                temp.remove(at: random)
            }
        } else {
            affirmation1.text = ""
            affirmation2.text = ""
            affirmation3.text = ""
            affirmation4.text = ""
            affirmation5.text = ""
        }
        affirmation1.frame.origin.x = CGFloat(Int.random(in: 0...screenWidth))
        affirmation1.frame.origin.y = CGFloat(Int.random(in: 0...screenHeight))
        affirmation1.textColor = .white
        affirmation1.font = UIFont(name: "Avenir Next",size: 25.0)
        affirmation1.sizeToFit()
        
        affirmation2.frame.origin.x = CGFloat(Int.random(in: 0...screenWidth))
        affirmation2.frame.origin.y = CGFloat(Int.random(in: 0...screenHeight))
        affirmation2.textColor = .white
        affirmation2.font = UIFont(name: "Avenir Next",size: 25.0)
        affirmation2.sizeToFit()
        
        affirmation3.frame.origin.x = CGFloat(Int.random(in: 0...screenWidth))
        affirmation3.frame.origin.y = CGFloat(Int.random(in: 0...screenHeight))
        affirmation3.textColor = .white
        affirmation3.font = UIFont(name: "Avenir Next",size: 25.0)
        affirmation3.sizeToFit()
        
        affirmation4.frame.origin.x = CGFloat(Int.random(in: 0...screenWidth))
        affirmation4.frame.origin.y = CGFloat(Int.random(in: 0...screenHeight))
        affirmation4.textColor = .white
        affirmation4.font = UIFont(name: "Avenir Next",size: 25.0)
        affirmation4.sizeToFit()
        
        affirmation5.frame.origin.x = CGFloat(Int.random(in: 0...screenWidth))
        affirmation5.frame.origin.y = CGFloat(Int.random(in: 0...screenHeight))
        affirmation5.textColor = .white
        affirmation5.font = UIFont(name: "Avenir Next",size: 25.0)
        affirmation5.sizeToFit()
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
    
    @IBAction func goToGoals(_ sender: Any) {
        self.performSegue(withIdentifier: "toGoals", sender: self)
    }
    
    @IBAction func goToJourney(_ sender: Any) {
        self.performSegue(withIdentifier: "toJourney", sender: self)
    }
    
    
    func addResponse(entry: String){
        ResponseList.insert(entry, at: 0)
        UserDefaults.standard.set(ResponseList, forKey: "responseList")
    }
    
    func setRed(activated: Bool){
        UserDefaults.standard.set(activated, forKey: "red")
        isRed = activated
    }
    
    func setBlue(activated: Bool){
        UserDefaults.standard.set(activated, forKey: "blue")
        isBlue = activated
    }
    
    func setGreen(activated: Bool){
        UserDefaults.standard.set(activated, forKey: "green")
        isGreen = activated
    }
    
    func setOrange(activated: Bool){
        UserDefaults.standard.set(activated, forKey: "orange")
        isOrange = activated
    }
    
    func setPurple(activated: Bool){
        UserDefaults.standard.set(activated, forKey: "purple")
        isPurple = activated
    }
    
    func setBird(activated: Bool){
        UserDefaults.standard.set(activated, forKey: "bird")
        isBird = activated
    }
    
    func setBreeze(activated: Bool){
        UserDefaults.standard.set(activated, forKey: "breeze")
        isBreeze = activated
    }
    
    func setWaves(activated: Bool){
        UserDefaults.standard.set(activated, forKey: "waves")
        isWaves = activated
    }
    
    func setWater(activated: Bool){
        UserDefaults.standard.set(activated, forKey: "water")
        isWater = activated
    }
    
    func setLeaves(activated: Bool){
        UserDefaults.standard.set(activated, forKey: "leaves")
        isLeaves = activated
    }
    
}
