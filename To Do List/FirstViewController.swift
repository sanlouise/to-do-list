//
//  FirstViewController.swift
//  To Do List
//
//  Created by Sandra Adams-Hallie on Feb/28/16.
//  Copyright © 2016 Sandra Adams-Hallie. All rights reserved.
//

import UIKit

// Create toDOList variable outside of the class to make it available to the other ViewController.

var toDoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var toDoListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Checks if any item has been stored yet.
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
        // For permanent storage
        toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
        
    }
    
    // Swiping to the left should delete the list item.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            toDoList.removeAtIndex(indexPath.row)
            //Whenever an item is removed, it should also be deleted in NSUserDefaults
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
            //Update the table
            toDoListTable.reloadData()
        }
    }

    // If called everything the view appears and is necessary to load the list with newly entered data.
    override func viewDidAppear(animated: Bool) {
        toDoListTable.reloadData()
    }
    
}

