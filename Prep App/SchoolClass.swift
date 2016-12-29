//
//  SchoolClass.swift
//  Prep App
//
//  Created by Chris Jerrett on 12/26/16.
//  Copyright © 2016 Chris Jerrett. All rights reserved.
//

import Foundation
import Alamofire

class SchoolClass:CustomDebugStringConvertible,Equatable {
    var id:Int
    var name:String
    var teacherId:Int
    var subjectId:Int
    var blockNum:Int?
    
    var blockLetter:String? {
        if let num = blockNum {
            let startingValue = Int(("A" as UnicodeScalar).value)-1
            return String(Character(UnicodeScalar(num + startingValue)))
        }
        return nil
    }
    
    var debugDescription: String {
        return "[\"id\":\(id), \"name\":\(name), \"teacherId\":\(teacherId)," +
            " \"subjectId\":\(subjectId), \"blockNum\(blockNum)), \"blockLetter\":\(blockLetter)\"]"
    }
    
    
    init(id:Int, name:String, teacherId:Int, subjectId:Int, blockNum:Int?) {
        self.id = id
        self.name = name
        self.teacherId = teacherId
        self.subjectId = subjectId
        self.blockNum = blockNum
    }
    
    func getTeacher()->Teacher? {
        for teacher in dataSource.getTeachers() {
            if teacher.id == teacherId {
                return teacher
            }
        }
        return nil
    }
    
    func enrollStudent(user:User)  {
        Alamofire.request(.GET, "\(baseURL)enrollInClass/\(user.id!)/\(id)")
    }
}

func == (lhs:SchoolClass, rhs:SchoolClass)->Bool {
    return lhs.id == rhs.id
}