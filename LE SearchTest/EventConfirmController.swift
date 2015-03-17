//
//  EventConfirmController.swift
//  LE SearchTest
//
//  Created by oopie doopie on 3/17/15.
//  Copyright (c) 2015 Eric Cauble. All rights reserved.
//

import Foundation
import UIKit

class EventConfirmController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
}