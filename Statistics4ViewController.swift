//
//  Statistics4ViewController.swift
//  OTT
//
//  Created by 박재유 on 2016. 6. 8..
//  Copyright © 2016년 Troy Stribling. All rights reserved.
//

import UIKit

class Statistics4ViewController: UITableViewController {

    @IBOutlet weak var tbAllMemberData: UITableView!
    
    var memberData : BrainMember!
    var marrMemberData : NSMutableArray!
    
    func getMemberData()
    {
        marrMemberData = NSMutableArray()
        marrMemberData = ModelManager.getInstance().getBrainAllData()
        tbAllMemberData.reloadData()
        
        
    }
    override func viewWillAppear(animated: Bool) {
        self.getMemberData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
        return marrMemberData.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Name with calculated relationship score"
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as UITableViewCell!
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: cellIdentifier)
        }
        /*
         let cell = tableView.dequeueReusableCellWithIdentifier("LabelCell", forIndexPath: indexPath)
         cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: "LabelCell")
         */
        let brain:BrainMember = marrMemberData.objectAtIndex((indexPath.row)) as! BrainMember
        
        
        cell.textLabel?.text = "\(brain.GROUP_MEMBER_NM) "
        cell.detailTextLabel?.text = "\(brain.RELATIONSHIP_SCORE) "
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //print(group.GROUP_NM)
        //if(indexPath.row == 0)
        //{
            //let group:Group = marrGroupData.objectAtIndex((indexPath.row)-1) as! Group
            //valueToPass = Int(group.GROUP_SEQ)!
            //valueToTitle = group.GROUP_NM
        //}
        //print("true answer : ?", valueToPass)
        self.performSegueWithIdentifier("seemore", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "seemore")
        {
            //let destinationVC:Statistics5ViewController = segue.destinationViewController as! Statistics5ViewController
            //destinationVC.title = "See All Members"
            
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
