//
//  ViewController.swift
//  Personel
//
//  Created by mohcine  on 10/4/15.
//  Copyright (c) 2015 Mohcine. All rights reserved.
//

import UIKit


//This is the MasterViewController

class MasterViewController: UITableViewController,UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating {
    
    
    //Instance Variables
    var retriever = EmployeesRetriever()
    var resultSearchController = UISearchController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.retriever.fetchData()
        
        
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
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        //In case the user touched a blank area of the screen we should hide the keyboard
        self.view.endEditing(true)
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
        
        let cell = tableView.dequeueReusableCellWithIdentifier("employeeCell", forIndexPath: indexPath) as! UITableViewCell
        
        var employeeToBeDisplayed : Employee!
        
        // 3
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
                let name  = comparedEmployee.fullName
                
                //closure return
                let resultRange = name.rangeOfString(query, options: NSStringCompareOptions.CaseInsensitiveSearch)
                
                return  resultRange != nil
                
        })
        
        self.tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

