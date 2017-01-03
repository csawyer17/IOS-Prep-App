//
//  MessageViewController.swift
//  Prep App
//
//  Created by Chris Jerrett on 1/3/17.
//  Copyright © 2017 Chris Jerrett. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    static var currentClass:SchoolClass!
    
    override func viewDidLoad() {
        print("view")
        super.viewDidLoad()
        let currentClass = MessageViewController.currentClass
        dataSource.getMessages(currentClass)
        
        
    }
    
}
