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

        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
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
            cell.textLabel?.text = "❗️\(task.name!)"
        }
        else{
             cell.textLabel?.text = "• \(task.name!)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let task = taskList[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    @IBAction func addTaskTapped(_ sender: Any) {
        performSegue(withIdentifier: "addTaskSegue", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  
        if(segue.identifier == "selectTaskSegue"){
            let nextVC = segue.destination as! UpdateTaskViewController
            nextVC.task = sender as? Task
            
        }
    }
    
    func getTasks(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            taskList = try context.fetch(Task.fetchRequest()) as! [Task]
        }
        catch {
            print("error getting tasks")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

