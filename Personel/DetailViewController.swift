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
    
    
}
