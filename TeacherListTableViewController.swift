//
//  teacherListTableViewController.swift
//  Prep App
//
//  Created by Chris Jerrett on 12/26/16.
//  Copyright © 2016 Chris Jerrett. All rights reserved.
//

import UIKit

class TeacherListTableViewController: UITableViewController {

    var teachers:[Teacher]!
    
    static var selectedteacher:Teacher?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teachers = dataSource.getTeachers(false)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teachers.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let first = teachers[indexPath.row].firstname
        let last = teachers[indexPath.row].lastname
        
        cell.textLabel!.text = "\(first) \(last)"
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTeacherClassesSegue" {
            let cell = sender as! UITableViewCell
            let index = super.tableView.indexPathForCell(cell)?.row
            let teacher = teachers[index!]
            TeacherListTableViewController.selectedteacher = teacher
        }
    }
    
}
