//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Mike Pitre on 9/23/15.
//  Copyright © 2015 Mike Pitre. All rights reserved.
//

import UIKit


var todos: [String] = []

class FirstViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NSUserDefaults.standardUserDefaults().objectForKey("todos") != nil {
        
            todos = NSUserDefaults.standardUserDefaults().objectForKey("todos") as! [String]
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return todos.count
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = todos[indexPath.row]
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            todos.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(todos, forKey: "todos")
            
            table.reloadData()
            
        }
        
    }


    override func viewDidAppear(animated: Bool) {
        
        table.reloadData()
        
    }
}

