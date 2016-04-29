//
//  SecondViewController.swift
//  To Do List
//
//  Created by Sandra Adams-Hallie on Feb/28/16.
//  Copyright © 2016 Sandra Adams-Hallie. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var item: UITextField!
    @IBAction func addItem(sender: AnyObject) {
        
        // Whatever is entered in the textField should be added to the list in the first controller. toDoList has already been defined there.
        toDoList.append(item.text!)
        item.text = ""
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
    }
    
    // Code to make keyboard disappear when user clicks outside of text field.
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Code to make keyboard dissapear when user clicks on return button.
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        item.resignFirstResponder()
        return true
    }
}

