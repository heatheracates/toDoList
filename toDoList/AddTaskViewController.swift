//
//  AddTaskViewController.swift
//  toDoList
//
//  Created by Heather Cates on 11/25/17.
//  Copyright © 2017 Heather Cates. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var isImportantSwitch: UISwitch!
    @IBOutlet weak var taskNameTextFeild: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        if (taskNameTextFeild.text != nil && taskNameTextFeild.text != ""){
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let task = Task(context: context)
            
            task.name = taskNameTextFeild.text!
            task.isImportant = isImportantSwitch.isOn
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            //move back to task list when done
            navigationController!.popViewController(animated: true)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
