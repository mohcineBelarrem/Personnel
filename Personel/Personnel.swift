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
//It also serves as a the storing tool for the searchEngine

class Personnel {
    
    var employeesArray        : [Employee]
    var filtredEmployeesArray : [Employee]
    
    init(){
        
        self.employeesArray = []
        self.filtredEmployeesArray = []
        
    }
    
    //description function to debug
    func description () -> String {
        
        var personnelString = "Number of employees : \(self.employeesArray.count)"
        
        for employee in self.employeesArray {
            
            personnelString +=  "\r\n++++++++++++++++++++++\r\n" + employee.description()
        }
        
        return personnelString
    }
    
    
    
}

