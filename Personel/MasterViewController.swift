//
//  ViewController.swift
//  Personel
//
//  Created by mohcine  on 10/4/15.
//  Copyright (c) 2015 Mohcine. All rights reserved.
//

import Foundation
import UIKit


//This is the MasterViewController
//It manages : 
//The tableView
//The search Engine
//The passing of data to detailViewController

class MasterViewController: UITableViewController,UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating {
    
    
    //Instance Variables
    var retriever = EmployeesRetriever()
    var resultSearchController = UISearchController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        //First thing we load the data
        self.retriever.fetchData()
        
        //We then init the searchBar and the Controller responsible of it
        self.resultSearchController = ({
            
            //This part inits the searchController and creates the searchBar programmaticaly
            
            let controller = UISearchController(searchResultsController: nil)
            
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            
            controller.searchBar.sizeToFit()
            
            controller.searchBar.placeholder = "Search for Employees"
            
            self.tableView.tableHeaderView = controller.searchBar
            
            
            //just for asthetics but it's worth it
            controller.searchBar.layer.borderWidth = 1
            controller.searchBar.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 205/255, alpha: 1).CGColor
            controller.searchBar.returnKeyType = UIReturnKeyType.Done
            
            return controller
        })()
        
        
        
        
    }
    
    
    // MARK : TableViewController Protocols
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        //height of a cell
        return 50.0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //number of cells
        
        if (self.resultSearchController.active) {
            
            //case the user is searching we display the results according to his query
            return self.retriever.employeesRecord.filtredEmployeesArray.count
        }
        else {
            //case he's not we display all the result
            return self.retriever.employeesRecord.employeesArray.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //cell content protocol
        
        let cell = tableView.dequeueReusableCellWithIdentifier("employeeCell", forIndexPath: indexPath) as! UITableViewCell
        
        var employeeToBeDisplayed : Employee!
        
        if (self.resultSearchController.active) {
            
            employeeToBeDisplayed = self.retriever.employeesRecord.filtredEmployeesArray[indexPath.row]
        }
        else {
            employeeToBeDisplayed = self.retriever.employeesRecord.employeesArray[indexPath.row]
        }
        
        cell.textLabel?.text = employeeToBeDisplayed.fullName
        
        return cell
    }
    
    
    
    // MARK : SearchResultsUpdating Protocol
    
    func updateSearchResultsForSearchController(searchController: UISearchController){
     
        //method triggered everytime the user changes the content of the searchController's searchBar
        
        self.retriever.employeesRecord.filtredEmployeesArray.removeAll(keepCapacity: false)
        
        self.retriever.employeesRecord.filtredEmployeesArray = self.retriever.employeesRecord.employeesArray.filter(
            
            //closure header (params) -+ (return type) in
            
            { (comparedEmployee : Employee) -> Bool in
                
                //closure body
                let query = searchController.searchBar.text
                
                //This is the information by which we want to filter searches
                //in this case it is the full name
                let contactInfoToBeComparedTo  = comparedEmployee.fullName
                
                //closure return
                let resultRange = contactInfoToBeComparedTo.rangeOfString(query, options: NSStringCompareOptions.CaseInsensitiveSearch)
                
                return  resultRange != nil
                
        })
        
        self.tableView.reloadData()
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
        if self.resultSearchController.active {
            
            self.resultSearchController.active = false
        }
        
    }
    
    //Method triggered just before going to detail so we can exploit it to pass data
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "detailSegue" {
            
            let detailVC = segue.destinationViewController as! DetailViewController
            let cell = sender as! UITableViewCell
            
            if let indexPath = self.tableView!.indexPathForCell(cell) {
                
                let employeeToBeDetailled : Employee!
                
                if self.resultSearchController.active {
                    
                    employeeToBeDetailled = self.retriever.employeesRecord.filtredEmployeesArray[indexPath.row]
                    
                } else {
                    
                     employeeToBeDetailled = self.retriever.employeesRecord.employeesArray[indexPath.row]
                }
                
                detailVC.employeeToBeDetailled = employeeToBeDetailled
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

