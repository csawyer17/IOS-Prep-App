//
//  TeacherClassesTableViewController.swift
//  Prep App
//
//  Created by Chris Jerrett on 12/27/16.
//  Copyright © 2016 Chris Jerrett. All rights reserved.
//

import UIKit

class TeacherClassesTableViewController: UITableViewController {

    var classes:[SchoolClass]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let teacher = TeacherListTableViewController.selectedteacher!
        classes = getClassesFromTeacher(teacher)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("classes", forIndexPath: indexPath)
        
        cell.textLabel?.text = classes[indexPath.row].name
        if let block = classes[indexPath.row].blockLetter {
            cell.detailTextLabel?.text = block
        } else {
            cell.detailTextLabel?.text = ""
        }
        
        return cell
    }
    
}
