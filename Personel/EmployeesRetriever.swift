//
//  EmployeesRetriever.swift
//  Personel
//
//  Created by mohcine  on 10/4/15.
//  Copyright (c) 2015 Mohcine. All rights reserved.
//

import Foundation
import UIKit

//This is the class responsible for parsing data from the Json file.

class EmployeesRetriever {
    
    //Instance variables...
    
    var employeesRecord : Personnel
    var couldLoadData = false
    var fileName = "IT"
    var jsonArrayName = "Employees"
    
    //Constructor...
    
    init() {
        
        self.employeesRecord = Personnel()
    }
    
    //methods..
    
    func fetchData() {
        
        //This method parses the data in the JSON file => transforms it into NSDictionnary
        //=> Transform it to Employee Objects
        
        //Inspired from : http://stackoverflow.com/questions/24410881/reading-in-a-json-file-using-swift
        
        if let path = NSBundle.mainBundle().pathForResource(self.fileName, ofType: "json") {
            
            if let jsonData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil) {
                
                if let jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary {
                    
                    if let employees = jsonResult[self.jsonArrayName] as? [NSDictionary] {
                        //At this point we are sure we could parse data
                        //But still we have to transform it into objects and store it in the model
                        
                        for employeeDictionary in employees {
                            
                            //here we take each employee which parsed as NSDictionary
                            //We create from it an Employee Object using the constructor
                            //and then we store it in the model
                            
                            let employeeObject = Employee(employee: employeeDictionary)
                    
                            self.employeesRecord.employeesArray.append(employeeObject)
                        }
                        
                        self.couldLoadData = true
                        
                        println(self.employeesRecord.description())
                        
                    }
                }
            }
        }
        
        if (self.couldLoadData == false) {
            
            var alertView = UIAlertView(title: "Error", message: "Couldn't load data from the file", delegate: nil, cancelButtonTitle: "Ok")
            
            alertView.show()
        }
    }
    
}