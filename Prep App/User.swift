//
//  User.swift
//  Prep App
//
//  Created by Chris Jerrett on 12/26/16.
//  Copyright © 2016 Chris Jerrett. All rights reserved.
//

import Foundation
import Alamofire

class User: CustomDebugStringConvertible{
    var username:String?
    var id:Int?
    
    var debugDescription: String {
        return "[\"username\":\(username), \"id\":\(id)]"
    }
    
    var enrolledClasses:[SchoolClass]?
    
    init(email:String, password:String) throws {
        if !login(email, password: password) {
            throw LoginError.INVALID_LOGIN
        }
        dataSource.user = self
    }
    
    func getEnrolledClasses(refresh:Bool) ->[SchoolClass] {
        if enrolledClasses == nil || refresh {
            enrolledClasses = dataSource.getEnrolledClasses(self)
        }
        return enrolledClasses!
    }
    
    private func login(email:String, password:String)->Bool {
        let parameters = ["email":email, "password":password]
        var success = false
        let semaphore = dispatch_semaphore_create(0)
        Alamofire.request(.POST,"http://198.199.123.216/api/login" , parameters: parameters).responseJSON() { response in
            
            if let jsonResponse = response.result.value  {
                if let error = jsonResponse as? NSDecimalNumber {
                    success = false
                    print(error)
                } else {
                    self.username = jsonResponse["email"] as? String
                    self.id = jsonResponse["id"] as? Int
                    success = true;
                }
            }
            dispatch_semaphore_signal(semaphore)
        }
    
        while dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW) != 0 {
            NSRunLoop.currentRunLoop().runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 10))
        }
        print(self)
        return success
    }
}

enum LoginError: ErrorType {
    case INVALID_LOGIN
}