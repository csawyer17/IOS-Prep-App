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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teachers = getTeachers()
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl?.addTarget(self, action: #selector(TeacherListTableViewController.refresh), forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refreshControl!)

    }
    
    func refresh() {
        teachers = getTeachers()
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
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
    
}
