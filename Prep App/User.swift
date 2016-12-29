//
//  User.swift
//  Prep App
//
//  Created by Chris Jerrett on 12/26/16.
//  Copyright © 2016 Chris Jerrett. All rights reserved.
//

import Foundation

class User {
    var username:String?
    var password:String?
    var id:Int?
    
    var enrolledClasses:[SchoolClass]?
    
    init(username:String, password:String) {
        
    }
    
    func getEnrolledClasses(refresh:Bool) ->[SchoolClass] {
        if enrolledClasses == nil || refresh {
            enrolledClasses = dataSource.getEnrolledClasses(self)
        }
        return enrolledClasses!
    }
}