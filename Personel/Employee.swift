//
//  Employee.swift
//  Personel
//
//  Created by mohcine  on 10/4/15.
//  Copyright (c) 2015 Mohcine. All rights reserved.
//


//This is the base class of the model it represents a simple Employee

import Foundation

class Employee {
    
    var firstName        : String
    var lastName         : String
    var phoneNumber      : String
    var fax              : String
    var email            : String
    var floor            : String
    var workUnit         : String
    var address          : String
    var county           : String
    var zipCode          : String
    var lineOfService    : String
    
    
    init (employee : NSDictionary){
        
        //The constructor is very simple we take the JSON employee objects parsed as NSDictionary
        //and then we transform them into employee Objects
        
        self.firstName = employee["FirstName"] as! String
        
        self.lastName = employee["LastName"] as! String
        
        self.phoneNumber = employee["PhoneNumber"] as! String
        
        self.fax = employee["Fax"] as! String
        
        self.email = employee["Email"] as! String
        
        self.floor = employee["Floor"] as! String
        
        self.workUnit = employee["WorkUnit"] as! String
        
        self.address = employee["Address"] as! String
        
        self.county = employee["County"] as! String
        
        self.zipCode = employee["ZipCode"] as! String
        
        self.lineOfService = employee["LineOfService"] as! String
        
    }
    
    //Computed read only properties
    
    var fullName  : String {
        
        return  self.firstName + " " + self.lastName
    }
    
    //Computed phone & fax
    
    var formattedPhoneNumber : String {
        
      return  formatPhone(self.phoneNumber)
    }
    
    var formattedFax : String {
        
        return  formatPhone(self.fax)
    }
    
    //Full Employee Description to help debug
    
    func description () -> String {
      
        return  self.fullName + "\r\n" + self.phoneNumber + "\r\n" + self.fax + "\r\n" + self.email + "\r\n" + self.floor + "\r\n" + self.workUnit + "\r\n" + self.address + "\r\n" + self.county + "\r\n" + self.zipCode + "\r\n" + self.lineOfService
    }
    
    
    //This method transforms an Employee object to an array so that the process
    //Of showing an Employee in Detail can be automated
    
    func toArray () -> [(String,String)] {
        
        
        var employeeArray = [(String,String)]()
        
        employeeArray.append(("Full Name",self.fullName))
        employeeArray.append(("Phone Number",self.formattedPhoneNumber))
        employeeArray.append(("Fax",self.formattedFax))
        employeeArray.append(("Email",self.email))
        employeeArray.append(("Floor",self.floor))
        employeeArray.append(("WorkUnit",self.workUnit))
        employeeArray.append(("Address",self.address))
        employeeArray.append(("County",self.county))
        employeeArray.append(("ZipCode",self.zipCode))
        employeeArray.append(("Line of service",self.lineOfService))
        
        
        return employeeArray
    }
    
    
    func formatPhone (numberToFormat : String) -> String {
        
        var formattedString = ""
        
        for var i=0 ; i<count(numberToFormat) ; i++ {
            
            let char = Array(numberToFormat)[i]
            
            if ( i==3 || i==6 ) {
                
                formattedString.append(Character("-"))
            }
            
            formattedString.append(char)
            
        }
        
        return formattedString
    }
}