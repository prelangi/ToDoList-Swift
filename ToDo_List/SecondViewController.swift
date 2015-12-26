//
//  SecondViewController.swift
//  ToDo_List
//
//  Created by Prasanthi Relangi on 12/26/15.
//  Copyright © 2015 prasanthi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

   
    @IBAction func addItem(sender: AnyObject) {
    
        print("Adding text %s",itemTextField.text!)
        
        toDoList.append(itemTextField.text!)
        
        itemTextField.text = ""
        
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        
    }

    @IBOutlet weak var itemTextField: UITextField!
    
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
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {   //delegate method
        itemTextField.resignFirstResponder()
        return true
    }




}

