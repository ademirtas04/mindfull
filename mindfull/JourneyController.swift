//
//  JourneyController.swift
//  mindfull
//
//  Created by Alp Demirtas on 7/23/20.
//  Copyright © 2020 Alp Demirtas.    All rights reserved.
//

import UIKit

class JourneyController: UIViewController {
    let numStops: Int = 15

    var journey = [JourneyStop]()
    

    override func viewDidLoad() {
        let firstJourney: JourneyStop = JourneyStop(title: "Write your name", description: "If we're going on this adventure, I might as well know your name.")
        journey.insert(firstJourney, at: 0)
        super.viewDidLoad()
    }
}
