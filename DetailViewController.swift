//
//  DetailViewController.swift
//  CollegeProfileBuilder
//
//  Created by Leimomi H. Podell on 3/23/17.
//  Copyright © 2017 Leimomi H. Podell. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var locationTextField: UITextField!
    
    @IBOutlet var populationTextField: UITextField!
    
    @IBOutlet var imageView: UIImageView!
    
    let college : college! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        nameTextField.text = college.name
        locationTextField.text = college.location
        populationTextField.text = String(college.population)
        
    }

    @IBAction func saveAtTime(_ sender: UIButton) {
       college.name = nameTextField.text!
        college.location = locationTextField.text!
        college.population = populationTextField.text!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }


}
