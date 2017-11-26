//
//  UpdateTaskViewController.swift
//  toDoList
//
//  Created by Heather Cates on 11/25/17.
//  Copyright © 2017 Heather Cates. All rights reserved.
//

import UIKit

class UpdateTaskViewController: UIViewController {
    
    var task : Task? = nil

    @IBOutlet weak var taskLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (task!.isImportant){
        taskLabel.text = "❗️\(task!.name!)"
        }
        else{
            taskLabel.text = task!.name!
        }
        
    }

    @IBAction func completeButtonTapped(_ sender: Any) {
   
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
