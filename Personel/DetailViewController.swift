//
//  DetailViewController.swift
//  Personel
//
//  Created by mohcine  on 10/4/15.
//  Copyright (c) 2015 Mohcine. All rights reserved.
//

import UIKit

class DetailViewController : UITableViewController {

    
    var employeeToBeDetailled : Employee!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.title! = self.employeeToBeDetailled.fullName
    
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return employeeToBeDetailled.toArray().count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //number of cells
        return 1
    }

   
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        //height of a cell
        return 50.0
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        //configuring the different headers titles of the tableView
     return employeeToBeDetailled.toArray()[section].0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //cell content protocol
        
        let cell = tableView.dequeueReusableCellWithIdentifier("detailCell", forIndexPath: indexPath) as! UITableViewCell
        
        //cell.textLabel?.text = employeeToBeDetailled.toArray()[indexPath.section].1
        
        let cellTextView = cell.viewWithTag(100) as! UITextView
        
        cellTextView.text = "  " + employeeToBeDetailled.toArray()[indexPath.section].1
        cellTextView.dataDetectorTypes = UIDataDetectorTypes.All
        
        return cell
    }
    
}
