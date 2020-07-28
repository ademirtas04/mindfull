//
//  GardenController.swift
//  mindfull
//
//  Created by Alp Demirtas on 7/26/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class GardenController: UIViewController {
    static var coins: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    static func addCoins(c: Int){
        coins = coins + c
    }

}
