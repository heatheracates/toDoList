//
//  TaskListViewController.swift
//  toDoList
//
//  Created by Heather Cates on 11/24/17.
//  Copyright © 2017 Heather Cates. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addTaskButton: UIBarButtonItem!
    var taskList : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskList = makeTask()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    //what goes in the row 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let task = taskList[indexPath.row]
        
        if (task.isImportant){
            cell.textLabel?.text = "❗️\(task.name)"
        }
        else{
             cell.textLabel?.text = "• \(task.name)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = taskList[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
   
    //get list of tasks already added to populate table
    func makeTask() -> [Task] {
        let task1 = Task()
        task1.name = "buy bread"
        task1.isImportant = false
        
        let task2 = Task()
        task2.name = "go to DMV"
        task2.isImportant = true
        
        let task3 = Task()
        task3.name = "clean desk"
        task3.isImportant = false
        
        return [task1, task2, task3]
    }

    @IBAction func addTaskTapped(_ sender: Any) {
        performSegue(withIdentifier: "addTaskSegue", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier ==
            "addTaskSegue"){        let nextVC = segue.destination as! AddTaskViewController
        nextVC.previousVC = self
        }
        if(segue.identifier ==
            "selectTaskSegue"){        let nextVC = segue.destination as! UpdateTaskViewController
            nextVC.task = sender as! Task
            //nextVC.previousVC = self
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

