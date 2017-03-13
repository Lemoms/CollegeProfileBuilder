//
//  ViewController.swift
//  CollegeProfileBuilder
//
//  Created by Leimomi H. Podell on 3/9/17.
//  Copyright © 2017 Leimomi H. Podell. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var CollegeProfile: UITableView!
    
    var colleges: [college] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let collegeOne = college(name: "SCAD", location: "Savanah, Georgia", population: "11,693")
        let collegeTwo = college(name: "harper", location: "Cook County, Illinois", population: "16,060")
        let collegeThree = college(name: "Tribecca Flash Point", location: "Chicago, Illinois", population: "1,758")
        colleges = [collegeOne, collegeTwo, collegeThree]
    }



}
