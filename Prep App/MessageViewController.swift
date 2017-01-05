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
    var messages:[Message]!

    
    @IBOutlet weak var keyboardHeightLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentClass = MessageViewController.currentClass
        messages = dataSource.getMessages(currentClass)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.keyboardNotification(_:)),name: UIKeyboardWillChangeFrameNotification,object: nil)
        
        
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func keyboardNotification(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.CGRectValue()
            let duration:NSTimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
            let animationCurveRawNSN = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
            let animationCurveRaw = animationCurveRawNSN?.unsignedLongValue ?? UIViewAnimationOptions.CurveEaseInOut.rawValue
            let animationCurve:UIViewAnimationOptions = UIViewAnimationOptions(rawValue: animationCurveRaw)
            if endFrame?.origin.y >= UIScreen.mainScreen().bounds.size.height {
                self.keyboardHeightLayoutConstraint?.constant = 10
            } else {
                self.keyboardHeightLayoutConstraint?.constant = endFrame?.size.height ?? 10
            }
            UIView.animateWithDuration(duration,delay: NSTimeInterval(0),options: animationCurve,animations: { self.view.layoutIfNeeded() },completion: nil)
            let indexPath = NSIndexPath(forRow: tableView.numberOfRowsInSection(0), inSection: 0)
            tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Middle, animated: true)
        }
    }
    
}
