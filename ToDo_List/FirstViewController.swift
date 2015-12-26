//
//  FirstViewController.swift
//  ToDo_List
//
//  Created by Prasanthi Relangi on 12/26/15.
//  Copyright © 2015 prasanthi. All rights reserved.
//

import UIKit

//Empty todoList array that can be accessed from both the view controllers
var toDoList = [String]()


class FirstViewController: UIViewController,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default,
            reuseIdentifier: "cell")
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
        
        
    }
    
    //Using swipe to left to delete entries in the todo list app
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.Delete) {
            toDoList.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil){
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        }
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
        
    }

}

