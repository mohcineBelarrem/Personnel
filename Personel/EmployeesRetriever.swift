//
//  EmployeesRetriever.swift
//  Personel
//
//  Created by mohcine  on 10/4/15.
//  Copyright (c) 2015 Mohcine. All rights reserved.
//

import Foundation


//This is the class responsible for parsing data from the Json file.

class EmployeesRetriever {
    
    //Instance variables...
    
    var employeesRecord : Personnel
    
    //Constructor...
    
    init() {
        
        self.employeesRecord = Personnel()
    }
    
    //methods..
    
    func fetchData() {
        
        //Inspired from : http://stackoverflow.com/questions/24410881/reading-in-a-json-file-using-swift
    
        if let path = NSBundle.mainBundle().pathForResource("IT", ofType: "json")
        {
            if let jsonData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)
            {
                if let jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary
                {
                    if let employees : NSArray = jsonResult["Employees"] as? NSArray
                    {
                        //At this point we are sure we could parse data
                        //But still we have to transform it into objects and store it in the model
                        
                        println("The array in the file contains \(employees.count)")
                    }
                }
            }
        }
    
    }
    
}