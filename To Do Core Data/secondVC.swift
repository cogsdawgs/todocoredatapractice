//
//  secondVC.swift
//  To Do Core Data
//
//  Created by Michael C on 9/22/16.
//  Copyright © 2016 Michael C. All rights reserved.
//

import UIKit

class secondVC: UIViewController {

    @IBOutlet weak var taskNameText: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var previousVC = TasksViewController()
    
    @IBAction func addButtonPressed(_ sender: AnyObject) {
        //create a task from the outlet info
        let task = Task()
        task.name = taskNameText.text!
        task.important = importantSwitch.isOn
        
        
        //add new task to the array
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
}
