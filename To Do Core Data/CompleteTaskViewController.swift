//
//  CompleteTaskViewController.swift
//  To Do Core Data
//
//  Created by Michael C on 9/22/16.
//  Copyright © 2016 Michael C. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    
  
    var previousVC = TasksViewController()
    
    @IBOutlet weak var taskLabel: UILabel!
    
    
    var task = Task()
    override func viewDidLoad() {
        super.viewDidLoad()
        if task.important {
            taskLabel.text = "❗️\(task.name)"
        } else {
            taskLabel.text = task.name
        }

        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func completePressed(_ sender: AnyObject) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
}
