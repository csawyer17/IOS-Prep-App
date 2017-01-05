//
//  LoginViewController.swift
//  Prep App
//
//  Created by Chris Jerrett on 1/4/17.
//  Copyright © 2017 Chris Jerrett. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        if identifier == "loginGood" {
            do {
                dataSource.user = try User(email: emailField.text!, password: passwordField.text!)
                return true
            } catch LoginError.INVALID_LOGIN {
                handleLoginError("Invalid username or password");
            } catch {
                handleLoginError("unknown error")
            }

        }
        return false
    }
    
    func handleLoginError(error:String) {
        emailField.text = ""
        passwordField.text = ""
        let alert = UIAlertController(title: "Alert", message: error, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
