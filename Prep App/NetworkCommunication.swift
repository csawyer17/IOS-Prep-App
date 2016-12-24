//
//  NetworkCommunication.swift
//  Prep App
//
//  Created by Chris Jerrett on 12/23/16.
//  Copyright © 2016 Chris Jerrett. All rights reserved.
//

import Foundation
import Alamofire

let baseURL = "https://prapp-api.000webhostapp.com/api/"


/**
 *  Gets the teachers in the database
 **/
func getTeachers() -> [Teacher] {
    var resultArray = [Teacher]()
    
    //creates a semaphore to handle async requests
    let semaphore = dispatch_semaphore_create(0)
    
    //creates the get request to the URL https://prapp-api.000webhostapp.com/api/getteachers
    //and parses JSON
    Alamofire.request(.GET, "\(baseURL)getTeachers").responseJSON() { response in
        if let json = response.result.value {
            let jsonResonse = json as! NSArray
            
            //loop through array of teachers returned in json
            for teacher in jsonResonse {
                let teacherDictionary = teacher as! NSDictionary
                
                //get info from dictionary and constructs teacher object
                let lastname = teacherDictionary["lastname"] as! String
                let firstname = teacherDictionary["firstname"] as! String
                let id = teacherDictionary["id"] as! Int
                let resultTeacher = Teacher(firstname: firstname, lastname: lastname, id: id)
                resultArray.append(resultTeacher)
                
                //dispatch the semaphore to inform the main thread that the request has finished
                dispatch_semaphore_signal(semaphore)
            }
        }
    }
    
    //wait for request to finish
    while dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW) != 0 {
        NSRunLoop.currentRunLoop().runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 10))
    }
    
    return resultArray
}

func getSubjects() -> [Subject] {
    var resultArray = [Subject]()
    
    //creates a semaphore to handle async requests
    let semaphore = dispatch_semaphore_create(0)
    
    //creates the get request to the URL https://prapp-api.000webhostapp.com/api/getsubjects
    //and parses JSON
    Alamofire.request(.GET, "\(baseURL)getSubjects").responseJSON() { response in
        if let json = response.result.value {
            let jsonResonse = json as! NSArray
            
            //loop through array of teachers returned in json
            for subject in jsonResonse {
                let subjectDictionary = subject as! NSDictionary
                
                //get info from dictionary and constructs subject object
                let name = subjectDictionary["name"] as! String
                let id = subjectDictionary["id"] as! Int
                let resultSubject = Subject(name: name, id: id)
                resultArray.append(resultSubject)
                
                //dispatch the semaphore to inform the main thread that the request has finished
                dispatch_semaphore_signal(semaphore)
            }
        }
    }
    
    //wait for request to finish
    while dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW) != 0 {
        NSRunLoop.currentRunLoop().runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 10))
    }
    
    return resultArray
}