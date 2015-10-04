//
//  Personnel.swift
//  Personel
//
//  Created by mohcine  on 10/4/15.
//  Copyright (c) 2015 Mohcine. All rights reserved.
//

import Foundation

//This is the class that will store all the employees
//It is basically an Array of employees

class Personnel {
    
    var employeesArray : [Employee]
    
    init(){
        
        self.employeesArray = []
        
    }
    
    func description () -> String {
        
        var personnelString = ""
        
        
        for employee in self.employeesArray {
            
            personnelString += "\r\n" + employee.description()
        }
        
        return personnelString
    }
    
    
    
}

