//
//  Group2ViewController.swift
//  BlueCap
//
//  Created by 박재유 on 2016. 6. 1..
//  Copyright © 2016년 Troy Stribling. All rights reserved.
//


import UIKit

class Group2ViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtMarks: UITextField!
    
    var isEdit : Bool = false
    var groupData : Group!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(isEdit)
        {
            txtName.text = groupData.GROUP_NM;
            //txtMarks.text = groupData.GROUP_VALUE;
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UIButton Action methods
    
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
        else if(txtMarks.text == "")
        {
            Util.invokeAlertMethod("", strBody: "Please enter friend marks.", delegate: nil)
        }
        else
        {
            if(isEdit)
            {
                let groupData: Group = Group()
                //groupData.RollNo = groupData.RollNo
                groupData.GROUP_NM = txtName.text!
                //groupData.GROUP_VALUE = txtMarks.text!
                let isUpdated = ModelManager.getInstance().updateGroupData(groupData)
                if isUpdated {
                    Util.invokeAlertMethod("", strBody: "Record updated successfully.", delegate: nil)
                } else {
                    Util.invokeAlertMethod("", strBody: "Error in updating record.", delegate: nil)
                }
            }
            else
            {
                let groupData: Group = Group()
                groupData.GROUP_NM = txtName.text!
                groupData.GROUP_ICON_FILE_NM = txtMarks.text!
                
                let isInserted = ModelManager.getInstance().addGroupData(groupData)
                if isInserted {
                    Util.invokeAlertMethod("", strBody: "Record Inserted successfully.", delegate: nil)
                } else {
                    Util.invokeAlertMethod("", strBody: "Error in inserting record.", delegate: nil)
                }
            }
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}

