//
//  UpdateTaskViewController.swift
//  toDoList
//
//  Created by Heather Cates on 11/25/17.
//  Copyright © 2017 Heather Cates. All rights reserved.
//

import UIKit

class UpdateTaskViewController: UIViewController {
    
    var task = Task()
    var previousVC = TaskListViewController()
    @IBOutlet weak var taskLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (task.isImportant){
        taskLabel.text = "❗️\(task.name)"
        }
        else{
            taskLabel.text = task.name
        }
        
    }

    @IBAction func completeButtonTapped(_ sender: Any) {
        //remove item
        previousVC.taskList.remove(at: previousVC.selectedIndex)
        //update the page when done
        previousVC.tableView.reloadData()
        //move back to task list when done
        navigationController!.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
