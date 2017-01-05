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
                _ = try User(email: emailField.text!, password: passwordField.text!)
            } catch LoginError.INVALID_LOGIN {
                print("invalid login")
                return false
            } catch {
                print("unknown error")
            }

        }
        return true
    }
}