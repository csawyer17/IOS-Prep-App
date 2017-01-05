//
//  User.swift
//  Prep App
//
//  Created by Chris Jerrett on 12/26/16.
//  Copyright © 2016 Chris Jerrett. All rights reserved.
//

import Foundation
import Alamofire

class User {
    var username:String?
    var password:String
    var id:Int?
    
    var enrolledClasses:[SchoolClass]?
    
    init(username:String, password:String) throws {
        
        throw LoginError.INVALID_LOGIN
    }
    
    func getEnrolledClasses(refresh:Bool) ->[SchoolClass] {
        if enrolledClasses == nil || refresh {
            enrolledClasses = dataSource.getEnrolledClasses(self)
        }
        return enrolledClasses!
    }
    
    private func login(username:String, password:String)->Bool {
        Alamofire.req
        return false
    }
}

enum LoginError: ErrorType {
    case INVALID_LOGIN
}