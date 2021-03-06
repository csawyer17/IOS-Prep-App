//
//  Teacher.swift
//  Prep App
//
//  Created by Chris Jerrett on 12/23/16.
//  Copyright © 2016 Chris Jerrett. All rights reserved.
//

import Foundation

class Teacher:CustomDebugStringConvertible {
    
    var firstname:String
    var lastname:String
    var id:Int
    
    private var classes:[SchoolClass]?
    
    var debugDescription: String {
        return "[\"firstname\": \(firstname),\"lastname\": \(lastname),\"id\": \(id)]"
    }
    
    init(firstname:String, lastname:String, id:Int) {
        self.firstname = firstname
        self.lastname = lastname
        self.id = id
    }
    
    func getClasses(refresh:Bool)->[SchoolClass]? {
        if !refresh {
            return classes
        }
        return dataSource.getClassesFromTeacher(self);
    }

}