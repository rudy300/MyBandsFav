//
//  MasterViewController.swift
//  MyBandsFav
//
//  Created by cis290 on 9/26/16.
//  Copyright © 2016 Rock Valley College. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    var detailViewController: DetailViewController? = nil
 
    // var objects = [AnyObject]()
    
    
    var listArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        
        
        listArray = ["chance","dr-dre","drake","frank", "logic","pablo", "pac","quest"]
        
        
        
        
        //let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        //self.navigationItem.rightBarButtonItem = addButton
        
        
        title = "My Favorite Bands"
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    //    func insertNewObject(sender: AnyObject) {
    //        objects.insert(NSDate(), atIndex: 0)
    //        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
    //        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    //    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                let object = listArray[indexPath.row] as! NSString
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                
                
                controller.productName = object as String
                controller.productURL = (object as String) + ".jpg"
                
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
                
                self.splitViewController?.toggleMasterView()
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        // return objects.count
        
     
        return listArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let object = listArray[indexPath.row] as! NSString
        cell.textLabel!.text = object.description
        return cell
    }
    
   
    
    //    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    //        // Return false if you do not want the specified item to be editable.
    //        return true
    //    }
    
    

    
    //    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    //        if editingStyle == .Delete {
    //            objects.removeAtIndex(indexPath.row)
    //            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    //        } else if editingStyle == .Insert {
    //            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    //        }
    //    }
    
    
    
}

extension UISplitViewController {
    func toggleMasterView() {
        let barButtonItem = self.displayModeButtonItem()
        UIApplication.sharedApplication().sendAction(barButtonItem.action, to: barButtonItem.target, from: nil, forEvent: nil)
    }
}




