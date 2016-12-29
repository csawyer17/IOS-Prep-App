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
        classes = teacher.getClasses(true)
        removeAlreadyEnrolledClasses()
    }
    
    func removeAlreadyEnrolledClasses() {
        let enrolledClasses = dataSource.getEnrolledClasses(dataSource.user!)
        for enrolledClass in enrolledClasses {
            if let i = classes.indexOf(enrolledClass) {
                classes.removeAtIndex(i)
            }
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("classes", forIndexPath: indexPath)
        
        cell.textLabel?.text = classes[indexPath.row].name
        if let block = classes[indexPath.row].blockLetter {
            cell.detailTextLabel?.text = "\(block) block"
        } else {
            cell.detailTextLabel?.text = ""
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let index = indexPath.row
        let classToEnroll = classes[index]
        
        
        let confrimAlert = UIAlertController(title: "Confirm", message: "Are you sure you want to join this class", preferredStyle: UIAlertControllerStyle.Alert)
        
        confrimAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
            classToEnroll.enrollStudent(dataSource.user!)
        }))
        
        confrimAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action: UIAlertAction!) in }))
        
        presentViewController(confrimAlert, animated: true, completion: nil)
    }
    
}
