//
//  CustomizeController.swift
//  mindfull
//
//  Created by Alp Demirtas on 7/31/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class CustomizeController: UIViewController {

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
    
    private var redUnlocked:Bool = false
    private var blueUnlocked:Bool = false
    private var greenUnlocked: Bool = false
    private var orangeUnlocked: Bool = false
    private var purpleUnlocked: Bool = false
    
    private var birdUnlocked: Bool = false
    private var breezeUnlocked: Bool = false
    private var waterUnlocked: Bool = false
    private var wavesUnlocked: Bool = false
    private var leavesUnlocked: Bool = false
    
    override func viewDidLoad() {
        setAllToPreferences()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToLandscape(_ sender: Any) {
        self.performSegue(withIdentifier: "toGarden", sender: self)
    }
    func setAllToPreferences(){
        if(redUnlocked){
            RedSwitch.setOn(true, animated: false)
        } else {
            RedSwitch.setOn(false,animated: false)
        }
        if(blueUnlocked){
            BlueSwitch.setOn(true, animated: false)
        } else {
            BlueSwitch.setOn(false,animated: false)
        }
        if(greenUnlocked){
            GreenSwitch.setOn(true, animated: false)
        } else {
            GreenSwitch.setOn(false,animated: false)
        }
        if(orangeUnlocked){
            OrangeSwitch.setOn(true,animated: false)
        } else {
            OrangeSwitch.setOn(false,animated: false)
        }
        if(purpleUnlocked){
            PurpleSwitch.setOn(true, animated: false)
        } else {
            PurpleSwitch.setOn(false,animated: false)
        }
        if(birdUnlocked){
            BirdSwitch.setOn(true, animated: false)
        } else {
            BirdSwitch.setOn(false,animated: false)
        }
        if(breezeUnlocked){
            BreezeSwitch.setOn(true, animated: false)
        } else {
            BreezeSwitch.setOn(false,animated: false)
        }
        if(waterUnlocked){
            WaterSwitch.setOn(true, animated: false)
        } else {
            WaterSwitch.setOn(false,animated: false)
        }
        if(wavesUnlocked){
            WavesSwitch.setOn(true, animated: false)
        } else {
            WavesSwitch.setOn(false,animated: false)
        }
        if(leavesUnlocked){
            LeavesSwitch.setOn(true, animated: false)
        } else {
            LeavesSwitch.setOn(false,animated: false)
        }
    }
    
    func getPurpleUnlocked() -> Bool{
        return purpleUnlocked
    }
    
    func getRedUnlocked() -> Bool{
        return redUnlocked
    }
    func getBlueUnlocked() -> Bool{
        return blueUnlocked
    }
    func getGreenUnlocked() -> Bool{
        return greenUnlocked
    }
    func getOrangeUnlocked() -> Bool{
        return orangeUnlocked
    }
    func getBirdUnlocked() -> Bool{
        return birdUnlocked
    }
    func getBreezeUnlocked() -> Bool{
        return breezeUnlocked
    }
    func getWaterUnlocked() -> Bool{
        return waterUnlocked
    }
    func getWavesUnlocked() -> Bool{
        return wavesUnlocked
    }
    func getLeavesUnlocked() -> Bool{
        return leavesUnlocked
    }
}
