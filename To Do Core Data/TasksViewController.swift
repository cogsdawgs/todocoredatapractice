//
//  TasksViewController.swift
//  To Do Core Data
//
//  Created by Michael C on 9/22/16.
//  Copyright © 2016 Michael C. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasks = makeTasks()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️\(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "walk dog"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Clean cat poop"
        
        let task3 = Task()
        task3.name = "Run"
        task3.important = true
        
        return [task1, task2, task3]
        
    }
    
    
    @IBAction func plusPressed(_ sender: AnyObject) {
        performSegue(withIdentifier: "addSegue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addSegue"{
            
            let nextVC = segue.destination as! secondVC
            nextVC.previousVC = self
        }
        if segue.identifier == "selectTaskSegue"{
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
            }
        
    }
    
}

