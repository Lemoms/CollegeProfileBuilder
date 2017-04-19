//
//  ViewController.swift
//  CollegeProfileBuilder
//
//  Created by Leimomi H. Podell on 3/9/17.
//  Copyright © 2017 Leimomi H. Podell. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var CollegeProfile: UITableView!
    
    @IBOutlet var editButton: UIBarButtonItem!
    
    
    
    var colleges: [college] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let collegeOne = college(name: "SCAD", location: "Savanah, Georgia", population: "11,693", collegeTextField: "add college")
        let collegeTwo = college(name: "harper", location: "Cook County, Illinois", population: "16,060", collegeTextField: "add college")
        let collegeThree = college(name: "Tribecca Flash Point", location: "Chicago, Illinois", population: "1,758", collegeTextField: "add college")
        colleges = [collegeOne, collegeTwo, collegeThree]
        editButton.tag = 0
        
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }
    
    
    
    func tableview(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId")
        let collegeProfile = colleges[indexPath.row]
        cell?.textLabel?.text = collegeProfile.name
        cell?.textLabel?.text = collegeProfile.location
        cell?.textLabel?.text = collegeProfile.population
        return cell!
        
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            colleges.remove(at: indexPath.row)
            tableView.reloadData()
        }

}
    
    
    
    @IBAction func TapTheButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "add college", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alert.addTextField{
            (textField) in
            textField.placeholder = "add college here"
        }
        alert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "add", style: .default) {
            (action) in
            let collegeTextField = alert.textFields![0] as UITextField
            self.colleges.append(college(name: collegeTextField.text!))
            self.CollegeProfile.reloadData()
            }
    alert.addAction(addAction)
    }
    
    
    
    @IBAction func EditButton(_ sender: UIBarButtonItem) {
        if sender.tag == 0 {
            CollegeProfile.isEditing = true
            sender.tag = 1
        }
        else {
            CollegeProfile.isEditing = false
            sender.tag = 0
        }
    }
    
    
   
    
   
    
    
    private func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
    func tableView(_ tableView: UITableView, movePowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let college = colleges[sourceIndexPath.row]
        colleges.remove(at: sourceIndexPath.row)
        colleges.insert(college, at: destinationIndexPath.row)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! DetailViewController
        let index = CollegeProfile.indexPathForSelectedRow?.row
        colleges[index!] = dvc.college
    }
    

}
