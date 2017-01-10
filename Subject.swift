//
//  Subject.swift
//  Prep App
//
//  Created by Chris Jerrett on 12/23/16.
//  Copyright © 2016 Chris Jerrett. All rights reserved.
//

import Foundation

class Subject:CustomDebugStringConvertible {
    
    var name:String
    var id:Int
    
    var debugDescription: String {
        return "[\"name\":\(name), \"id\":\(id)]"
    }
    
    
    init(name:String, id:Int) {
        self.id = id
        self.name = name
    }
}