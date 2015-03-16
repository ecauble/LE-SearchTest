//
//  ConfirmEventController.swift
//  LE SearchTest
//
//  Created by Eric Cauble on 3/15/15.
//  Copyright (c) 2015 Eric Cauble. All rights reserved.
//

import UIKit

class ConfirmEventController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
   
    
    
    //REMOVE
    var nameList : [String] = ["Jay Barker", "Eric Cauble", "Wes Turner"]
    var imgList : [String] = ["jay","eric","wes"]
    var eventTitle = String()
    var eventStart = NSDate()
    var eventEnd = NSDate()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        //title passed from previous controller as
        self.title = "Invite to \(eventTitle)"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell",
            forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = nameList[indexPath.row]
        cell.imageView?.image = UIImage(named: imgList[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    deinit
    {
        "InviteController was deinitialized"
    }
    
}
