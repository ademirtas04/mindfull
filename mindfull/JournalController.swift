//
//  JournalController.swift
//  mindfull
//
//  Created by Alp Demirtas on 8/4/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import UIKit

class JournalController: UIViewController {

    var journalText: String = ""
    @IBOutlet weak var journalField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        journalField.text = journalText

        // Do any additional setup after loading the view.
    }
    
    func addLine(line: String){
        journalText = journalText + "\n" + line
        journalField.text = journalText
    }
    
    func addChunk(chunk: String) {
        journalText = journalText + "\n" + chunk
        journalField.text = journalText
    }
    
    @IBAction func goToGarden(_ sender: Any) {
        self.performSegue(withIdentifier: "toGarden", sender: self)
    }
    
    
    
    
    

}
