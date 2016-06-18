//
//  Group4ViewController.swift
//  OTT
//
//  Created by 박재유 on 2016. 6. 7..
//  Copyright © 2016년 Troy Stribling. All rights reserved.
//

import UIKit

class Group4ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtValue: UITextField!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //print("Second VC will appear")
    }
    @IBOutlet weak var NewFriendTableView: UITableView!
    var objects = [String]()
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        //print("Second VC will disappear")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        NewFriendTableView.delegate = self
        NewFriendTableView.dataSource = self
        //self.objects.append("Eric's Apple Watch")
        //self.objects.append("iPhone 6")
        //self.objects.append("Father's Galaxy S7")
        //self.objects.append("MacBook Pro")
        
        txtName.delegate = self
        txtValue.delegate = self
        txtValue.keyboardType = UIKeyboardType.NumberPad
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Search result"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.objects.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as UITableViewCell!
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
        }

        //configure you cell here.

        cell.textLabel?.text = self.objects[indexPath.row]

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //print(group.GROUP_NM)
        //[tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = .Checkmark
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = .None
    }

    @IBAction func btnBackClicked(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func btnSaveClicked(sender: AnyObject)
    {
        if(txtName.text == "")
        {
            Util.invokeAlertMethod("", strBody: "Please enter friend name.", delegate: nil)
        }
        else if(txtValue.text == "")
        {
            Util.invokeAlertMethod("", strBody: "Please enter friend marks.", delegate: nil)
        }
        else
        {

            let memberData: GroupMember = GroupMember()
            memberData.GROUP_MEMBER_NM = txtName.text!
            memberData.GROUP_MEMBER_VALUE = txtValue.text!
                
            let isInserted = ModelManager.getInstance().addMemberData(memberData)
            if isInserted {
                Util.invokeAlertMethod("", strBody: "Record Inserted successfully.", delegate: nil)
            } else {
                Util.invokeAlertMethod("", strBody: "Error in inserting record.", delegate: nil)
            }
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}

