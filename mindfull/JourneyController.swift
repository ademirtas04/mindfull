//
//  JourneyController.swift
//  mindfull
//
//  Created by Alp Demirtas on 7/23/20.
//  Copyright © 2020 Alp Demirtas.    All rights reserved.
//

import UIKit

class JourneyController: UIViewController {
    static var coins: Int = 0
    var completed: Int = 0
    let numStops: Int = 15
    
    

    @IBOutlet weak var Header: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var stopOne: UIButton!
    @IBOutlet weak var stopTwo: UIButton!
    @IBOutlet weak var stopThree: UIButton!
    @IBOutlet weak var stopFour: UIButton!
    @IBOutlet weak var stopFive: UIButton!
    @IBOutlet weak var stopSix: UIButton!
    @IBOutlet weak var stopSeven: UIButton!
    @IBOutlet weak var stopEight: UIButton!
    @IBOutlet weak var stopNine: UIButton!
    @IBOutlet weak var stopTen: UIButton!
    @IBOutlet weak var stopEleven: UIButton!
    @IBOutlet weak var stopTwelve: UIButton!
    @IBOutlet weak var stopThirteen: UIButton!
    @IBOutlet weak var stopFourteen: UIButton!
    @IBOutlet weak var stopFifteen: UIButton!
    
    
    var journey = [JourneyStop]()
    

    override func viewDidLoad() {
        let firstJourney: JourneyStop = JourneyStop(title: "Write your name", description: "If we're going on this adventure, I might as well know your name.")
        journey.insert(firstJourney, at: 0)
        super.viewDidLoad()
    }
    
    static func addCoins(c: Int){
        coins = coins + c
    }
    
    
    @IBAction func stopOnePressed(_ sender: Any) {
        Header.text = "Your First Mindfulness Exercise"
        Description.text = "Meditate for 30 seconds"
    }
    
    @IBAction func arrowPressed(_ sender: Any) {
        if(Header.text == "Your First Mindfulness Exercise" && completed == 0){
            stopOne.setImage(UIImage(named: "completed"), for: .normal)
            JourneyController.addCoins(c: 200)
            GardenController.addCoins(c: 200)
            completed = completed + 1
        }
        if(Header.text == "Let's Do a Quick Body Scan" && completed == 1){
            stopTwo.setImage(UIImage(named: "completed"), for: .normal)
            JourneyController.addCoins(c: 200)
            GardenController.addCoins(c: 200)
            completed = completed + 1
        }
        if(Header.text == "Let's Try Mindful Eating" && completed == 2){
            stopThree.setImage(UIImage(named: "completed"), for: .normal)
            JourneyController.addCoins(c: 200)
            GardenController.addCoins(c: 200)
            completed = completed + 1
        }
        if(Header.text == "Let's Try Mindful Journaling" && completed == 3){
            stopFour.setImage(UIImage(named: "completed"), for: .normal)
            JourneyController.addCoins(c: 200)
            GardenController.addCoins(c: 200)
            completed = completed + 1
        }
        if(Header.text == "Let's Go on a Mindful Walk" && completed == 4){
            stopFive.setImage(UIImage(named: "completed"), for: .normal)
            JourneyController.addCoins(c: 200)
            GardenController.addCoins(c: 200)
            completed = completed + 1
        }
    }
    
    @IBAction func stopTwoPressed(_ sender: Any) {
        Header.text = "Let's Do a Quick Body Scan"
        Description.text = "Body Scan for 2 minutes"
    }
    
    
    @IBAction func stopThreePressed(_ sender: Any) {
        Header.text = "Let's Try Mindful Eating"
        Description.text = "Analyze the taste and texture of your next meal"
    }
    
    
    @IBAction func stopFourPressed(_ sender: Any) {
        Header.text = "Let's Try Mindful Journaling"
        Description.text = "Write five things you are grateful for"
    }
    
    
    @IBAction func stopFivePressed(_ sender: Any) {
        Header.text = "Let's Go on a Mindful Walk"
        Description.text = "Walk for at least 20 minutes and note all of the colors you see"
    }
    
    
    @IBAction func stopSixPressed(_ sender: Any) {
    }
    
    
    @IBAction func stopSevenPressed(_ sender: Any) {
    }
    
    
    @IBAction func stopEightPressed(_ sender: Any) {
    }
    
    
    @IBAction func stopNinePressed(_ sender: Any) {
    }
    
    
    @IBAction func stopTenPressed(_ sender: Any) {
    }
    
    
    @IBAction func stopElevenPressed(_ sender: Any) {
    }
    
    
    @IBAction func stopTwelvePressed(_ sender: Any) {
    }
    
    
    @IBAction func stopThirteenPressed(_ sender: Any) {
    }
    
    
    @IBAction func stopFourteenPressed(_ sender: Any) {
    }
    
    
    @IBAction func stopFifteenPresssed(_ sender: Any) {
    }
    
    
    @IBAction func toDWG(_ sender: Any) {
        self.performSegue(withIdentifier: "toDWG", sender: self)
    }
    
    @IBAction func toPG(_ sender: Any) {
        self.performSegue(withIdentifier: "toPG", sender: self)
    }
}
