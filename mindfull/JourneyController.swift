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
    }
    
    @IBAction func stopTwoPressed(_ sender: Any) {
    }
    
    
    @IBAction func stopThreePressed(_ sender: Any) {
    }
    
    
    @IBAction func stopFourPressed(_ sender: Any) {
    }
    
    
    @IBAction func stopFivePressed(_ sender: Any) {
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
    
    
}
