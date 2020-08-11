//
//  JournalController.swift
//  mindfull
//
//  Created by Alp Demirtas on 8/4/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit
class JournalController: UIViewController {

    var journalList = [Entry]()
    var currentDate: Date = Date()
    var entries: Int = 0
    var index: Int = 0
    
    @IBOutlet weak var dateTitle: UILabel!
    
    @IBOutlet weak var journalField: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if let x = UserDefaults.standard.object(forKey: "journal") as? [Entry] {
            journalList = x
        }
        if(journalList.count != 0){
            let date: Date = journalList[0].date
            currentDate = date
            let calendar = Calendar.current
            let dd = calendar.component(.day, from: date)
            let MM = calendar.component(.month, from: date)
            let yyyy = calendar.component(.year, from: date)
            dateTitle.text = "\(dd)/\(MM)/\(yyyy)"
            entries = 0
            for entry in journalList {
                let d: Date = entry.date
                let calendar = Calendar.current
                let DD = calendar.component(.day, from: d)
                let mm = calendar.component(.month, from: d)
                let YYYY = calendar.component(.year, from: d)
                if(dd == DD && MM == mm && yyyy == YYYY){
                    let min = calendar.component(.minute, from: date)
                    let hour = calendar.component(.hour, from: date)
                    journalField.text = journalField.text + "\n" + "\(hour):\(min)" + "\n" + entry.prompt + "\n" + entry.body
                    entries = entries + 1
                }
            }
        }
    }
    
    @IBAction func leftPressed(_ sender: Any) {
        if(index != 0){
            index = index - 1
            let date: Date = journalList[index].date
            let calendar = Calendar.current
            let dd = calendar.component(.day, from: date)
            let MM = calendar.component(.month, from: date)
            let yyyy = calendar.component(.year, from: date)
            dateTitle.text = "\(dd)/\(MM)/\(yyyy)"
            entries = 0
            
            for entry in journalList {
                entries = 0
                let d: Date = entry.date
                let calendar = Calendar.current
                let DD = calendar.component(.day, from: d)
                let mm = calendar.component(.month, from: d)
                let YYYY = calendar.component(.year, from: d)
                if(dd == DD && MM == mm && yyyy == YYYY){
                    let min = calendar.component(.minute, from: date)
                    let hour = calendar.component(.hour, from: date)
                    journalField.text = journalField.text + "\n" + "\(hour):\(min)" + "\n" + entry.prompt + "\n" + entry.body
                    entries = entries + 1
                }
            }
        }
    }
    
    
    @IBAction func rightPressed(_ sender: Any) {
        if(index + entries < journalList.count){
            index = index + entries
            let date: Date = journalList[index].date
            let calendar = Calendar.current
            let dd = calendar.component(.day, from: date)
            let MM = calendar.component(.month, from: date)
            let yyyy = calendar.component(.year, from: date)
            dateTitle.text = "\(dd)/\(MM)/\(yyyy)"
            entries = 0
            
            for entry in journalList {
                entries = 0
                let d: Date = entry.date
                let calendar = Calendar.current
                let DD = calendar.component(.day, from: d)
                let mm = calendar.component(.month, from: d)
                let YYYY = calendar.component(.year, from: d)
                if(dd == DD && MM == mm && yyyy == YYYY){
                    let min = calendar.component(.minute, from: date)
                    let hour = calendar.component(.hour, from: date)
                    journalField.text = journalField.text + "\n" + "\(hour):\(min)" + "\n" + entry.prompt + "\n" + entry.body
                    entries = entries + 1
                }
            }
        }
        
    }
    
    @IBAction func goToGarden(_ sender: Any) {
        /*
        do{
            let encodedData = try NSKeyedArchiver.archivedData(withRootObject: journalList, requiringSecureCoding: false)
            let userDefaults = UserDefaults.standard
            userDefaults.set(encodedData, forKey: "journal")
        } catch {
            print(error)
        }
        */
        self.performSegue(withIdentifier: "toGarden", sender: self)
    }
    
    
    
    
    

}
