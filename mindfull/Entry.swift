//
//  Journal.swift
//  mindfull
//
//  Created by Alp Demirtas on 8/6/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import Foundation

class Entry {
    
    var date = Date()
    var prompt: String = ""
    var body: String = ""
    init (prompt: String, body: String){
        self.date = Date()
        self.prompt = prompt
        self.body = body
    }
    
    init(prompt: String, body: String, date: Date){
        self.date = date
        self.prompt = prompt
        self.body = body
    }
    
    func getDate() -> Date {
        return self.date
    }
    
}
