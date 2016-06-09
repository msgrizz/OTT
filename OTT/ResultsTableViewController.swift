//
//  ResultsTableViewController.swift
//  OTT
//
//  Created by 박재유 on 2016. 6. 9..
//  Copyright © 2016년 Troy Stribling. All rights reserved.
//

import UIKit
import MapKit

class ResultsTableViewController: UITableViewController {
    
    var mapItems: [MKMapItem]!

    var CellImages = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CellImages = ["Picture1.png", "Picture2.png", "Picture3.png", "Picture4.png", "Picture5.png", "Picture6.png", "Picture7.png", "Picture8.png"]
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
        return 1
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue,
                                  sender: AnyObject?) {
        let routeViewController = segue.destinationViewController
            as! RouteViewController
        
        let indexPath = self.tableView.indexPathForSelectedRow!
        
        let row = indexPath.row
        
        routeViewController.destination = mapItems![row]
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mapItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "resultCell", forIndexPath: indexPath) as! ResultsTableCell
        
        // Configure the cell...
        let row = indexPath.row
        let item = mapItems[row]
        
        if ( row < 8){
            cell.nameLabel.text = "도곡근린공원"
            cell.phoneLabel.text = "#아빠와 #등산 #우리가함께한시간 #힐링힐링"
            cell.takePicture.image = UIImage(named: CellImages[row])
        }
        else{
            cell.nameLabel.text = item.name
            cell.phoneLabel.text = item.phoneNumber
            cell.takePicture.image = UIImage(named: "Badge.png")
        }
        

        return cell
        
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
