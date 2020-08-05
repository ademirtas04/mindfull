//
//  CustomizeController.swift
//  mindfull
//
//  Created by Alp Demirtas on 7/31/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class CustomizeController: UIViewController {
    
    var responseList: [String] = []

    @IBOutlet weak var RedSwitch: UISwitch!
    @IBOutlet weak var BlueSwitch: UISwitch!
    @IBOutlet weak var GreenSwitch: UISwitch!
    @IBOutlet weak var OrangeSwitch: UISwitch!
    @IBOutlet weak var PurpleSwitch: UISwitch!
    
    
    @IBOutlet weak var BirdSwitch: UISwitch!
    @IBOutlet weak var BreezeSwitch: UISwitch!
    @IBOutlet weak var WaterSwitch: UISwitch!
    @IBOutlet weak var WavesSwitch: UISwitch!
    @IBOutlet weak var LeavesSwitch: UISwitch!
    
    var redUnlocked:Bool = false
    var blueUnlocked:Bool = false
    var greenUnlocked: Bool = false
    var orangeUnlocked: Bool = false
    var purpleUnlocked: Bool = false
    
    var birdUnlocked: Bool = false
    var breezeUnlocked: Bool = false
    var waterUnlocked: Bool = false
    var wavesUnlocked: Bool = false
    var leavesUnlocked: Bool = false
    
    var usingRed:Bool = false
    var usingBlue:Bool = false
    var usingGreen: Bool = false
    var usingOrange: Bool = false
    var usingPurple: Bool = false
    
    var usingBird: Bool = false
    var usingBreeze: Bool = false
    var usingWater: Bool = false
    var usingWaves: Bool = false
    var usingLeaves: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if(redUnlocked){
            RedSwitch.isEnabled = true
            if(usingRed){
                RedSwitch.setOn(true, animated: false)
            } else {
                RedSwitch.setOn(false, animated: false)
            }
        } else {
            RedSwitch.isEnabled = false
        }
        
        if(blueUnlocked){
            BlueSwitch.isEnabled = true
            if(usingBlue){
                BlueSwitch.setOn(true, animated: false)
            } else {
                BlueSwitch.setOn(false, animated: false)
            }
        } else {
            BlueSwitch.isEnabled = false
        }
        
        if(greenUnlocked){
            GreenSwitch.isEnabled = true
            if(usingGreen){
                GreenSwitch.setOn(true, animated: false)
            } else {
                GreenSwitch.setOn(false, animated: false)
            }
        } else {
            GreenSwitch.isEnabled = false
        }
        
        if(orangeUnlocked){
            OrangeSwitch.isEnabled = true
            if(usingOrange){
                OrangeSwitch.setOn(true, animated: false)
            } else {
                OrangeSwitch.setOn(false, animated: false)
            }
        } else {
            OrangeSwitch.isEnabled = false
        }
        
        if(purpleUnlocked){
            PurpleSwitch.isEnabled = true
            if(usingPurple){
                PurpleSwitch.setOn(true, animated: false)
            } else {
                PurpleSwitch.setOn(false, animated: false)
            }
        } else {
            PurpleSwitch.isEnabled = false
        }
        
        if(birdUnlocked){
            BirdSwitch.isEnabled = true
            if(usingBird){
                BirdSwitch.setOn(true, animated: false)
            } else {
                BirdSwitch.setOn(false, animated: false)
            }
        } else {
            BirdSwitch.isEnabled = false
        }
        
        if(breezeUnlocked){
            BreezeSwitch.isEnabled = true
            if(usingBreeze){
                BreezeSwitch.setOn(true, animated: false)
            } else {
                BreezeSwitch.setOn(false, animated: false)
            }
        } else {
            BreezeSwitch.isEnabled = false
        }
        
        if(waterUnlocked){
            WaterSwitch.isEnabled = true
            if(usingWater){
                WaterSwitch.setOn(true, animated: false)
            } else {
                WaterSwitch.setOn(false, animated: false)
            }
        } else {
            WaterSwitch.isEnabled = false
        }
        
        if(wavesUnlocked){
            WavesSwitch.isEnabled = true
            if(usingWaves){
                WavesSwitch.setOn(true, animated: false)
            } else {
                WavesSwitch.setOn(false, animated: false)
            }
        } else {
            WavesSwitch.isEnabled = false
        }
        
        if(leavesUnlocked){
            LeavesSwitch.isEnabled = true
            if(usingLeaves){
                LeavesSwitch.setOn(true, animated: false)
            } else {
                LeavesSwitch.setOn(false, animated: false)
            }
        } else {
            LeavesSwitch.isEnabled = false
        }
    }
    
    
    @IBAction func goToLandscape(_ sender: Any) {
        self.performSegue(withIdentifier: "toGarden", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toGarden"){
            let gardenVC = segue.destination as! GardenController
            gardenVC.isRed = RedSwitch.isOn
            gardenVC.isBlue = BlueSwitch.isOn
            gardenVC.isGreen = GreenSwitch.isOn
            gardenVC.isOrange = OrangeSwitch.isOn
            gardenVC.isPurple = PurpleSwitch.isOn
            gardenVC.isBird = BirdSwitch.isOn
            gardenVC.isBreeze = BreezeSwitch.isOn
            gardenVC.isWater = WaterSwitch.isOn
            gardenVC.isWaves = WavesSwitch.isOn
            gardenVC.isLeaves = LeavesSwitch.isOn
        }
    }
}
