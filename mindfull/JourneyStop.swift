//
//  JourneyStop.swift
//  mindfull
//
//  Created by Alp Demirtas on 7/23/20.
//  Copyright © 2020 Alp Demirtas. All rights reserved.
//

import Foundation

class JourneyStop {
    
    private var title: String = ""
    private var description: String = ""
    private var completed: Bool = false

    init (title :String, description :String){
        self.title = title
        self.description = description
    }

    func getTitle() -> String{
        return title
    }

    func getDescription() -> String{
        return description
    }

    func getCompleted() -> Bool {
        return completed
    }

    func complete() {
        completed = true
    }

}
