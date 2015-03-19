//
//  MenuController.swift
//  LE SearchTest
//
//  Created by Eric Cauble on 3/12/15.
//  Copyright (c) 2015 Eric Cauble. All rights reserved.
//
import UIKit

class MenuController: UITableViewController  {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var userImage: UIImageView!
    
    
    
    let service = "Locksmith"
    let userAccount = "LocksmithUser"
    let key = "myKey"
    let user = PFUser.currentUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()


        let (dictionary, error) = Locksmith.loadData(forKey: key, inService: service, forUserAccount: userAccount)
        
        if let dictionary = dictionary {
            userNameLabel.text = PFUser.currentUser().username
        }
        else
        {
         self.performSegueWithIdentifier("showLogin", sender: self)
            userNameLabel.text = ""
            
        }
        
    loadImage()
        
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
    
    func loadImage()
    {
        if let avatarImage:PFFile = user["userImage"] as? PFFile
        {
             avatarImage.getDataInBackgroundWithBlock{(imageData:NSData!, error:NSError!)-> Void in
                
                if !(error != nil)
                {
                    
                    self.userImage.image = UIImage(data: imageData)
 
                    
                }
        }
        }
    }

}
