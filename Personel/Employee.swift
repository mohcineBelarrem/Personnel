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
    
    //Computed read only property
    
    var fullName  : String {
        
        return  self.firstName + " " + self.lastName
    }
    
    //Full Employee Description to help debug
    
    func description () -> String {
        
        return self.fullName + "\r\n" + self.phoneNumber + "\r\n" + self.fax + "\r\n" + self.email + "\r\n" + self.floor + "\r\n" + self.workUnit + "\r\n" + self.address + "\r\n" + self.county + "\r\n" + self.zipCode + "\r\n" + self.lineOfService
    }
    
}