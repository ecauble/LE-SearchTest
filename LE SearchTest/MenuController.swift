//
//  MenuController.swift
//  LE SearchTest
//
//  Created by Eric Cauble on 3/12/15.
//  Copyright (c) 2015 Eric Cauble. All rights reserved.
//
import UIKit

class MenuController: UITableViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var logOutButton: UIButton!
    
    let service = "Locksmith"
    let userAccount = "LocksmithUser"
    let key = "myKey"
 
    
    override func viewDidLoad() {
        super.viewDidLoad()


        let (dictionary, error) = Locksmith.loadData(forKey: key, inService: service, forUserAccount: userAccount)
        
        if let dictionary = dictionary {
            userNameLabel.text = PFUser.currentUser().username
        }
        else
        {
         // self.performSegueWithIdentifier("showLogin", sender: self)
            userNameLabel.text = ""

        }
        
    }
    

    

    
    @IBAction func logOutUser(sender: AnyObject) {
        Locksmith.deleteData(forKey: key, inService: service, forUserAccount: userAccount)
        logOutButton.setTitle("Log in", forState: UIControlState.Normal)
        PFUser.logOut()
    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    deinit{
        println("menuView deinit")
    }
    
    
}
