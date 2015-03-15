//
//  LoginController.swift
//  LE SearchTest
//
//  Created by Eric Cauble on 3/12/15.
//  Copyright (c) 2015 Eric Cauble. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {

    @IBOutlet weak var menuButton:UIBarButtonItem!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    
   
    var user = PFUser()
    var object = PFObject(className: "User")
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //obscures password textfield
        userPassword.secureTextEntry = true
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

    }
    
    
    
    @IBAction func addUser(sender: AnyObject) {
        //lazy form validation for testing
        if userPassword.text != "" && userName.text != "" && userEmail.text != "" {
            user.username = userName.text
            user.password = userPassword.text
            user.email = userEmail.text
            user.signUpInBackgroundWithBlock {
                (succeeded: Bool!, error: NSError!) -> Void in
                if error == nil {
                    var number = PFObject(className: "UserInfo")
                    number.setObject(self.userName.text, forKey: "userName")
   
                    number.saveInBackgroundWithBlock {
                        (success: Bool!, error: NSError!) -> Void in
                        if (success != nil) {
                            println(("Object created with id: \(number.objectId)"))
                        } else {
                            println(" ", error)
                        }
                    }
                    var alert = UIAlertView()
                    alert.message = "User Signed Up";
                    alert.addButtonWithTitle("OK")
                    alert.show()
                    
                    
                } else {
                    // Show the errorString somewhere and let the user try again.
                    println("error")
                }
            }
            
            
        }
            
        else//there was a goof
        {
            var alert = UIAlertView()
            alert.message = "Please enter the required information in the text fields highlighted in red"
            alert.addButtonWithTitle("OK")
            alert.show()
            userName.backgroundColor = UIColor.redColor()
            userName.textColor = UIColor.whiteColor()
            userPassword.backgroundColor = UIColor.redColor()
            userPassword.textColor = UIColor.whiteColor()
            userEmail.backgroundColor = UIColor.redColor()
            userEmail.textColor = UIColor.whiteColor()
            
        }
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit{
        println("loginView was deinitialized")
    }
    
}
