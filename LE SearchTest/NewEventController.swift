//
//  NewEventController.swift
//  LE SearchTest
//
//  Created by Eric Cauble on 3/14/15.
//  Copyright (c) 2015 Eric Cauble. All rights reserved.
//

import UIKit

class NewEventController: UIViewController, UITextFieldDelegate {
    //MARK: - Outlets
    @IBOutlet weak var eventTitleTextField: UITextField!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var startTimeTextField: UIButton!
    @IBOutlet weak var endTimeTextField: UIButton!
    
    //MARK: - Varibales
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
        var tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        self.view.addGestureRecognizer(tap)
        eventTitleTextField.delegate = self
    }
    
//MARK: - Actions
    @IBAction func startTimeTouched(sender: AnyObject)
    {
        DatePickerDialog().show(title: "DatePickerDialog", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .DateAndTime) {
            (date) -> Void in
            self.startTimeTextField.setTitle("\(self.formatDate(date))", forState: nil)
            self.startTime = (date)
        }
        self.startTimeTextField.resignFirstResponder()
    }
    
    //MARK: - TODO: ensure endTime cannot be before startTime
   @IBAction func endTimeTouched(sender: AnyObject)
    {
        
        DatePickerDialog().show(title: "DatePickerDialog", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .DateAndTime) {
            (date) -> Void in
            self.endTimeTextField.setTitle("\(self.formatDate(date))", forState: nil)
            self.endTime = (date)
        }
        self.endTimeTextField.resignFirstResponder()
        var tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        self.view.addGestureRecognizer(tap)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "showInviteVC")
        {
            var inviteView = segue.destinationViewController as! InviteController;
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
 
    
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        self.view.endEditing(true)
    }
    

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        eventTitleTextField.resignFirstResponder()
        return true;
    }
    
    deinit{
        println("NewEventController deinit")
    }
   
    
}


