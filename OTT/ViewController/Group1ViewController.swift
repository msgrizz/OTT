//
//  HomeScreenViewController.swift
//  DbDemoExampleSwift
//
//  Created by TheAppGuruz-New-6 on 11/08/15.
//  Copyright (c) 2015 TheAppGuruz-New-6. All rights reserved.
//

import UIKit

class Group1ViewController: UIViewController , UITableViewDataSource,UITableViewDelegate {
    var valueToPass:Int = 0
    var marrGroupData : NSMutableArray!
    @IBOutlet weak var tbGroupData: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.getGroupData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Other methods
    
    func getGroupData()
    {
        marrGroupData = NSMutableArray()
        marrGroupData = ModelManager.getInstance().getAllGroupData()
        tbGroupData.reloadData()
    }

    //MARK: UITableView delegate methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marrGroupData.count + 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:StudentCell = tableView.dequeueReusableCellWithIdentifier("cell") as! StudentCell
        if(indexPath.row == 0)
        {
            cell.lblContent.text = "Name : All Members  \n  Value : 7.11"
        }
        else{
            let group:Group = marrGroupData.objectAtIndex((indexPath.row)-1) as! Group
            cell.lblContent.text = "Name : \(group.GROUP_NM)  \n  Value : \(group.GROUP_VALUE)"
            cell.btnDelete.tag = (indexPath.row)-1
            cell.btnEdit.tag = (indexPath.row)-1
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //print(group.GROUP_NM)
        if(indexPath.row == 0)
        {
            valueToPass = Int("9999")!
        }
        else
        {
            let group:Group = marrGroupData.objectAtIndex((indexPath.row)-1) as! Group
            valueToPass = Int(group.GROUP_SEQ)!
        }
        //print("true answer : ?", valueToPass)
        self.performSegueWithIdentifier("detailSegue", sender: self)
        
    }
    
    //MARK: UIButton Action methods

    @IBAction func btnDeleteClicked(sender: AnyObject) {
        let btnDelete : UIButton = sender as! UIButton
        let selectedIndex : Int = btnDelete.tag
        let friend: Group = marrGroupData.objectAtIndex(selectedIndex) as! Group
        let isDeleted = ModelManager.getInstance().deleteGroupData(friend)
        if isDeleted {
            Util.invokeAlertMethod("", strBody: "Record deleted successfully.", delegate: nil)
        } else {
            Util.invokeAlertMethod("", strBody: "Error in deleting record.", delegate: nil)
        }
        self.getGroupData()
    }

    @IBAction func btnEditClicked(sender: AnyObject)
    {
        self.performSegueWithIdentifier("editSegue", sender: sender)
    }
    
    //MARK: Navigation methods

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "editSegue")
        {
            let btnEdit : UIButton = sender as! UIButton
            let selectedIndex : Int = btnEdit.tag
            let viewController : Group2ViewController = segue.destinationViewController as! Group2ViewController
            viewController.isEdit = true
            viewController.groupData = marrGroupData.objectAtIndex(selectedIndex) as! Group
        }
        else if(segue.identifier == "detailSegue")
        {
            //get a reference to the destination view controller
            let destinationVC:Group3ViewController = segue.destinationViewController as! Group3ViewController
            
            //set properties on the destination view controller
            destinationVC.groupMemberSeq = valueToPass
            //print("destinationVC.value : ?", destinationVC.groupMemberSeq)
            //print("valuetopass : ?", valueToPass)
            //etc...
        }
    }

}
