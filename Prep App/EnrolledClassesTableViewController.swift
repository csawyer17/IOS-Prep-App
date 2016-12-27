//
//  EnrolledClassesTableViewController.swift
//  Prep App
//
//  Created by Chris Jerrett on 12/26/16.
//  Copyright © 2016 Chris Jerrett. All rights reserved.
//

import UIKit

class EnrolledClassesTableViewController: UITableViewController {
    
    var classes:[SchoolClass]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = User(username: "Chris", password: "Password")
        user.id = 1
        
        classes = getEnrolledClasses(user)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (classes?.count)!;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let name = classes![indexPath.row].name
        cell.textLabel!.text = "\(name)"
        
        if let teacher = classes![indexPath.row].getTeacher() {
            cell.detailTextLabel!.text = "\(teacher.firstname) \(teacher.lastname)"
        } else {
            cell.detailTextLabel!.text = ""
        }
    
        return cell

    }
}
