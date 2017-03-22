//
//  ViewController.swift
//  CollegeProfileBuilder
//
//  Created by Leimomi H. Podell on 3/9/17.
//  Copyright © 2017 Leimomi H. Podell. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIBarButtonItem, SFSafariViewControllerDelegate {
    
    @IBOutlet var CollegeProfile: UITableView!
    @IBOutlet var editButton: UIBarButtonItem!
    
    var urlString = "HTTP://google.com"
    
    var colleges: [college] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let collegeOne = college(name: "SCAD", location: "Savanah, Georgia", population: "11,693")
        let collegeTwo = college(name: "harper", location: "Cook County, Illinois", population: "16,060")
        let collegeThree = college(name: "Tribecca Flash Point", location: "Chicago, Illinois", population: "1,758")
        colleges = [collegeOne, collegeTwo, collegeThree]
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
            (textField) in textField.placeholder = "add college here"
        }
        alert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "add", style: .default) {
            (action) in
            let collegeTextField = alert.textFields![0] as UITextField
            self.colleges.append(collegeTextField.text!)
            }
        alert.addAction(addAction)
    
    }
    
    @IBAction func editWithButton(_ sender: UIBarButtonItem) {
        
    }
    
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    @IBAction func doneButton(_ sender: UIButton) {
        let url = NSURL(string: urlString)!
        let svc = SFSafariViewController(url: url as URL)
        present(svc, animated: true, completion: nil)
    }


}
