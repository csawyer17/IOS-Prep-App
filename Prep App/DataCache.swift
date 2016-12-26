//
//  DataCache.swift
//  Prep App
//
//  Created by Chris Jerrett on 12/26/16.
//  Copyright © 2016 Chris Jerrett. All rights reserved.
//

import Foundation

class DataCache {
    var teachers:[Teacher]?
    var subjects:[Subject]?
    
    init() {
        teachers = getTeachers()
        subjects = getSubjects()
    }
    
}