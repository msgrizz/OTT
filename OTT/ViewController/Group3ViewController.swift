//
//  Table2ViewController.swift
//  TabBar
//
//  Created by 박재유 on 2016. 5. 16..
//  Copyright © 2016년 eBookFrenzy. All rights reserved.
//

import UIKit

class Group3ViewController: UIViewController , UITableViewDataSource,UITableViewDelegate {
    
    // MARK: - UITableViewDataSource
    var memberData : GroupMember!
    var marrMemberData : NSMutableArray!
    var groupMemberSeq : Int!
    
    @IBOutlet weak var tbMemberData: UITableView!
    
    func getMemberData(Group_SEQ: Int)
    {
        marrMemberData = NSMutableArray()
        marrMemberData = ModelManager.getInstance().getGroupMemberData(Group_SEQ)
        tbMemberData.reloadData()
    }

    @IBAction func btnBackClicked(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.getMemberData(groupMemberSeq)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return marrMemberData.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Name with value"
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LabelCell", forIndexPath: indexPath)
        
        let member:GroupMember = marrMemberData.objectAtIndex((indexPath.row)) as! GroupMember
        cell.textLabel?.text = "\(member.GROUP_MEMBER_NM) "
        return cell
    }
    
    
}


