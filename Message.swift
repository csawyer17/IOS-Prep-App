//
//  Message.swift
//  Prep App
//
//  Created by Chris Jerrett on 1/3/17.
//  Copyright © 2017 Chris Jerrett. All rights reserved.
//

import Foundation

class Message {
    var text:String
    var user:OtherUser
    
    init(text:String, user:OtherUser) {
        self.text = text
        self.user = user
    }
}