//
//  NewEventController.swift
//  LE SearchTest
//
//  Created by Eric Cauble on 3/14/15.
//  Copyright (c) 2015 Eric Cauble. All rights reserved.
//

import UIKit

class NewEventController: UIViewController {
    
    @IBOutlet weak var eventTitleTextField: UITextField!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var startTimeTextField: UITextField!
    @IBOutlet weak var endTimeTextField: UITextField!
    
    var datePicker = DatePickerDialog()
    var startTime = NSDate()
    var endTime = NSDate()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //necessary in every viewcontroller that needs to access menu
        if self.revealViewController() != nil{
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
    }
    

    @IBAction func startTimeTouched(sender: AnyObject)
    {
        DatePickerDialog().show(title: "DatePickerDialog", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .DateAndTime) {
            (date) -> Void in
            self.startTimeTextField.text = "\(self.formatDate(date))"
            self.startTime = (date)
        }
        self.startTimeTextField.resignFirstResponder()
    }
    
    //TODO: - ensure endtime cannot be before starttime
   @IBAction func endTimeTouched(sender: AnyObject)
    {
        
        DatePickerDialog().show(title: "DatePickerDialog", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .DateAndTime) {
            (date) -> Void in
            self.endTimeTextField.text = "\(self.formatDate(date))"
            self.endTime = (date)
        }
        self.endTimeTextField.resignFirstResponder()

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "showInviteVC")
        {
            var inviteView = segue.destinationViewController as InviteController;
            inviteView.eventTitle = eventTitleTextField.text
             inviteView.eventStart = startTime
            inviteView.eventEnd = endTime
        }
    }

    //returns a String in the correct date format
    func formatDate(eventTime : NSDate) -> String{
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.doesRelativeDateFormatting = true
        
        let timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        
        var time = "\(dateFormatter.stringFromDate(eventTime)), \(timeFormatter.stringFromDate(eventTime))"
        return time
    }
    
    deinit{
        println("NewEventController deinit")
    }
   
    
}


