//
//  NetworkCommunication.swift
//  Prep App
//
//  Created by Chris Jerrett on 12/23/16.
//  Copyright © 2016 Chris Jerrett. All rights reserved.
//

import Foundation
import Alamofire

let baseURL = "http://198.199.123.216/api/"

/**
 *  Gets the teachers in the database
 **/
func getTeachers() -> [Teacher] {
    var resultArray = [Teacher]()
    
    //creates a semaphore to handle async requests
    let semaphore = dispatch_semaphore_create(0)
    
    //creates the get request to the URL http://198.199.123.216//api/getteachers
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
    
    //creates the get request to the URL http://198.199.123.216/api/getsubjects
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

func getClassesFromTeacher(teacher:Teacher)->[SchoolClass] {
    var resultArray = [SchoolClass]()
    
    let semaphore = dispatch_semaphore_create(0)
    
    Alamofire.request(.GET, "\(baseURL)getClassesFromTeacherId/\(teacher.id)").responseJSON() { response in
        if let json = response.result.value  {
            let jsonResponse = json as! NSDictionary
            for item in jsonResponse {
                let id = item.value["id"] as! Int
                let name = item.value["name"] as! String
                let subjectId = item.value["subject"] as! Int
                let teacherId = item.value["teacher_id"] as! Int
                
                let schoolClass = SchoolClass(id: id, name: name, teacherId: teacherId, subjectId: subjectId)
                print(schoolClass)
                resultArray.append(schoolClass)
                
            }
        }
        //dispatch the semaphore to inform the main thread that the request has finished
        dispatch_semaphore_signal(semaphore)
    }
    
    while dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW) != 0 {
        NSRunLoop.currentRunLoop().runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 10))
    }
    
    return resultArray
}

func getEnrolledClasses(user:User) -> [SchoolClass] {
    let semaphore = dispatch_semaphore_create(0)
    var results = [SchoolClass]()
    if let id = user.id {
        let ids = getEnrolledClassesIds(id)
        let classes = getClasses()
        
        for schoolClass in classes {
            for id in ids {
                if schoolClass.id == id {
                    results.append(schoolClass)
                }
            }
        }
        
        dispatch_semaphore_signal(semaphore)
    }
    
    while dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW) != 0 {
        NSRunLoop.currentRunLoop().runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 10))
    }
    
    return results
}

private func getEnrolledClassesIds(id:Int)->[Int] {
    var results = [Int]()
    
    let semaphore = dispatch_semaphore_create(0)
    
    Alamofire.request(.GET, "\(baseURL)getEnrolledClasses/\(id)").responseJSON() { response in
        if let json = response.result.value {
            let jsonResonse = json as! NSArray
            for entries in jsonResonse {
                let dictionary = entries as! NSDictionary
                results.append(dictionary["class_id"] as! Int)
            }
        }
        dispatch_semaphore_signal(semaphore)
    }
    
    
    //wait for request to finish
    while dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW) != 0 {
        NSRunLoop.currentRunLoop().runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 10))
    }
    
    //removes possible duplicates
    return Array(Set(results))
}

func getClasses()->[SchoolClass] {
    
    var resultArray = [SchoolClass]()
    
    let semaphore = dispatch_semaphore_create(0)

    Alamofire.request(.GET, "\(baseURL)getClasses").responseJSON() { response in
        if let json = response.result.value {
            let jsonResonse = json as! NSArray
            
            //loop through array of teachers returned in json
            for schoolClassDict in jsonResonse {
                let id = schoolClassDict["id"] as! Int
                let teacherId = schoolClassDict["teacher_id"] as! Int
                let name = schoolClassDict["name"] as! String
                let subjectId = schoolClassDict["subject"] as! Int
                
                let schoolClass = SchoolClass(id: id, name: name, teacherId: teacherId, subjectId: subjectId)
                resultArray.append(schoolClass)
                
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