//
//  JourneyController.swift
//  mindfull
//
//  Created by Alp Demirtas on 7/23/20.
//  Copyright © 2020 Alp Demirtas.    All rights reserved.
//

import UIKit

class JourneyController: UIViewController {
    var coins: Int = 0
    var completed: Int = 0
    let numStops: Int = 15
    
    

    @IBOutlet weak var Header: UILabel!
    @IBOutlet weak var Description: UILabel!
    var journey = [JourneyStop]()
    

    override func viewDidLoad() {
        let firstJourney: JourneyStop = JourneyStop(title: "Write your name", description: "If we're going on this adventure, I might as well know your name.")
        journey.insert(firstJourney, at: 0)
        super.viewDidLoad()
    }
    
    func addCoins(c: Int){
        coins = coins + c
    }
    
    
    @IBAction func stopOnePressed(_ sender: Any) {
        Header.text = "Your First Mindfulness Exercise"
        Description.text = "Meditate for 30 seconds"
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
