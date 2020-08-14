//
//  XPBar.swift
//  mindfull
//
//  Created by Alp Demirtas on 8/13/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import Foundation

class XPBar {
    
    static let shared = XPBar()
    
    var audioXP: Int = 0
    var writtenXP: Int = 0
    var productivityXP = 0
    var environmentXP: Int = 0
    var assessmentXP: Int = 0
    
    init(){
        if let x = UserDefaults.standard.object(forKey: "audioXP") as? Int {
            audioXP = x
        }
        if let x = UserDefaults.standard.object(forKey: "writtenXP") as? Int {
            writtenXP = x
        }
        
        if let x = UserDefaults.standard.object(forKey: "productivityXP") as? Int {
            writtenXP = x
        }
        
        if let x = UserDefaults.standard.object(forKey: "environmentXP") as? Int {
            environmentXP = x
        }
        if let x = UserDefaults.standard.object(forKey: "assessmentXP") as? Int {
            assessmentXP = x
        }
    }
    
    func addAudioXP(xp: Int){
        audioXP += xp
        UserDefaults.standard.set(audioXP, forKey: "audioXP")
    }
    
    func addWrittenXP(xp: Int){
        writtenXP += xp
        UserDefaults.standard.set(writtenXP, forKey: "writtenXP")
    }
    
    func addProductivityXP(xp: Int) {
        productivityXP += xp
        UserDefaults.standard.set(writtenXP, forKey: "productivityXP")
    }
    
    func addEnvironmentXP(xp: Int){
        environmentXP += xp
        UserDefaults.standard.set(environmentXP, forKey: "environmentXP")
    }
    
    func addAssessmentXP(xp: Int){
        assessmentXP += xp
        UserDefaults.standard.set(assessmentXP, forKey: "assessmentXP")
    }
    
    func unlockedAudio() -> Int {
        if let x = UserDefaults.standard.object(forKey: "audioXP") as? Int {
            audioXP = x
        }
        if(audioXP >= 10) {
            return 1
        } else if(audioXP > 150) {
            return 2
        } else if(audioXP > 250) {
            return 3
        } else if(audioXP > 350) {
            return 4
        } else if(audioXP > 500) {
            return 5
        } else {
            return 0
        }
    }
    
    func unlockedWritten() -> Int {
        if let x = UserDefaults.standard.object(forKey: "writtenXP") as? Int {
            writtenXP = x
        }
        if(writtenXP > 50) {
            return 1
        } else if(writtenXP > 150) {
            return 2
        } else if(writtenXP > 250) {
            return 3
        } else if(writtenXP > 350) {
            return 4
        } else if(writtenXP > 500) {
            return 5
        } else {
            return 0
        }
    }
    
    func unlockedProductivity() -> Int {
        if let x = UserDefaults.standard.object(forKey: "productivityXP") as? Int {
            productivityXP = x
        }
        if(productivityXP > 50) {
            return 1
        } else if(productivityXP > 150) {
            return 2
        } else if(productivityXP > 250) {
            return 3
        } else if(productivityXP > 350) {
            return 4
        } else if(productivityXP > 500) {
            return 5
        } else {
            return 0
        }
    }
    
    func unlockedEnvironment() -> Int {
        if let x = UserDefaults.standard.object(forKey: "environmentXP") as? Int {
            environmentXP = x
        }
        if(environmentXP > 50) {
            return 1
        } else if(environmentXP > 150) {
            return 2
        } else if(environmentXP > 250) {
            return 3
        } else if(environmentXP > 350) {
            return 4
        } else if(environmentXP > 500) {
            return 5
        } else {
            return 0
        }
    }
    
    func unlockedAssessment() -> Int {
        if let x = UserDefaults.standard.object(forKey: "assessmentXP") as? Int {
            assessmentXP = x
        }
        if(assessmentXP > 50) {
            return 1
        } else if(assessmentXP > 150) {
            return 2
        } else if(assessmentXP > 250) {
            return 3
        } else if(assessmentXP > 350) {
            return 4
        } else if(assessmentXP > 500) {
            return 5
        } else {
            return 0
        }
    }
}
