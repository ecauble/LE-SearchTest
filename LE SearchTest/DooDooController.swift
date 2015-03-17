//
//  DooDooController.swift
//  LE SearchTest
//
//  Created by Eric Cauble on 3/17/15.
//  Copyright (c) 2015 Eric Cauble. All rights reserved.
//
import UIKit

class DooDooController: UIViewController {
    //MARK: - Outlets
 
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //necessary in every viewcontroller that needs to access menu
        if self.revealViewController() != nil{
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    
    }
}


