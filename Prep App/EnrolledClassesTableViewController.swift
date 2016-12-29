//
//  EnrolledClassesTableViewController.swift
//  Prep App
//
//  Created by Chris Jerrett on 12/26/16.
//  Copyright © 2016 Chris Jerrett. All rights reserved.
//

import UIKit

var reload = false

class EnrolledClassesTableViewController: UITableViewController {
    
    var classes:[SchoolClass]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        classes = dataSource.user!.getEnrolledClasses(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if reload {
            classes = dataSource.user!.getEnrolledClasses(true)
            tableView.reloadData()
        }
    }
    
    func refresh() {
        classes = dataSource.user!.getEnrolledClasses(true)
        print(classes)
        self.tableView.reloadData()
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
