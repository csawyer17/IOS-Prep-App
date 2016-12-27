//
//  SchoolClass.swift
//  Prep App
//
//  Created by Chris Jerrett on 12/26/16.
//  Copyright © 2016 Chris Jerrett. All rights reserved.
//

import Foundation

class SchoolClass:CustomDebugStringConvertible {
    var id:Int
    var name:String
    var teacherId:Int
    var subjectId:Int
    
    var debugDescription: String {
        return "[\"id\":\(id), \"name\":\(name), \"teacherId\":\(teacherId), \"subjectId\":\(subjectId)]"
    }
    
    
    init(id:Int, name:String, teacherId:Int, subjectId:Int) {
        self.id = id
        self.name = name
        self.teacherId = teacherId
        self.subjectId = subjectId
    }
    
    func getTeacher()->Teacher? {
        for teacher in getTeachers() {
            if teacher.id == teacherId {
                return teacher
            }
        }
        return nil
    }
}