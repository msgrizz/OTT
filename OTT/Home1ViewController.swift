//
//  Home1ViewController.swift
//  OTT
//
//  Created by 박재유 on 2016. 6. 3..
//  Copyright © 2016년 Troy Stribling. All rights reserved.
//


import UIKit

class Home1ViewController: UITableViewController {
    
    var CellImages = [String]()
    var CellNames = [String]()
    var valueToTitle:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CellNames = ["Intimate Space", "Personal Space", "Social Space", "Public Space"]
        
        CellImages = ["Intimate.png", "Personal.png", "Social.png", "Public.png"]
        
        tableView.estimatedRowHeight = 50
        
        self.styleNavigationBar()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return CellNames.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Home1Cell", forIndexPath: indexPath) as! Home1ViewCell
        
        let row = indexPath.row
        cell.CellLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        cell.CellLabel.text = CellNames[row]
        cell.CellImage.image = UIImage(named: CellImages[row])
        
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //print(group.GROUP_NM)
        
        valueToTitle = indexPath.row

        self.performSegueWithIdentifier("spaceSegue", sender: self)
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "spaceSegue")
        {
            //get a reference to the destination view controller
            let destinationVC:PeripheralsViewController = segue.destinationViewController as! PeripheralsViewController
            
            //set properties on the destination view controller
            
            if (valueToTitle == 0)
            {
                destinationVC.title = "Intimate"
            }
            else if(valueToTitle == 1)
            {
                destinationVC.title = "Personal"
            }
            else if(valueToTitle == 2)
            {
                destinationVC.title = "Social"
            }
            else if(valueToTitle == 3)
            {
                destinationVC.title = "Public"
            }
            //print("destinationVC.value : ?", destinationVC.groupMemberSeq)
            //print("valuetopass : ?", valueToPass)
            //etc...
        }
    }

    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}