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
    @IBOutlet weak var bgImage: UIImageView!
    static var coins: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
    
    static func addCoins(c: Int){
        coins = coins + c
    }
}
