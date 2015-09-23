//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Mike Pitre on 9/23/15.
//  Copyright © 2015 Mike Pitre. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var item: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        
        todos.append(item.text!)
        
        item.text = ""
        
        NSUserDefaults.standardUserDefaults().setObject(todos, forKey: "todos")
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        item.resignFirstResponder()
        
        return true
        
    }


}

