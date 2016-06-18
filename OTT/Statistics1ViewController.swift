//
//  Statistics1ViewController.swift
//  OTT
//
//  Created by 박재유 on 2016. 6. 4..
//  Copyright © 2016년 Troy Stribling. All rights reserved.
//

import UIKit

class Statistics1ViewController: UIViewController {
    @IBOutlet weak var seventh: UILabel!
    @IBOutlet weak var eighth: UILabel!
    @IBOutlet weak var second: UILabel!
    @IBOutlet weak var sixth: UILabel!
    @IBOutlet weak var fifth: UILabel!
    @IBOutlet weak var fourth: UILabel!
    @IBOutlet weak var third: UILabel!
    @IBOutlet weak var first: UILabel!

    @IBOutlet weak var onmymind: UILabel!
    
    var memberData : BrainMember!
    var marrMemberData : NSMutableArray!
    
    func getMemberData()
    {
        marrMemberData = NSMutableArray()
        marrMemberData = ModelManager.getInstance().getBrainAllData()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.getMemberData()
        
        var brain:BrainMember = marrMemberData.objectAtIndex((0)) as! BrainMember
        self.first.text! = brain.GROUP_MEMBER_NM
        self.onmymind.text! = brain.GROUP_MEMBER_NM + " is on my mind."
        
        brain = marrMemberData.objectAtIndex((1)) as! BrainMember
        self.second.text! = brain.GROUP_MEMBER_NM
        
        brain = marrMemberData.objectAtIndex((2)) as! BrainMember
        self.third.text! = brain.GROUP_MEMBER_NM
        
        brain = marrMemberData.objectAtIndex((3)) as! BrainMember
        self.fourth.text! = brain.GROUP_MEMBER_NM
        
        brain = marrMemberData.objectAtIndex((4)) as! BrainMember
        self.fifth.text! = brain.GROUP_MEMBER_NM
        
        brain = marrMemberData.objectAtIndex((5)) as! BrainMember
        self.sixth.text! = brain.GROUP_MEMBER_NM
        
        brain = marrMemberData.objectAtIndex((6)) as! BrainMember
        self.seventh.text! = brain.GROUP_MEMBER_NM
        
        brain = marrMemberData.objectAtIndex((7)) as! BrainMember
        self.eighth.text! = brain.GROUP_MEMBER_NM
        
        super.viewWillAppear(animated)
    }
    
    

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        //print("First VC will disappear")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "seeall")
        {
            let destinationVC:Statistics4ViewController = segue.destinationViewController as! Statistics4ViewController
            destinationVC.title = "See All Members"
            
        }
    }

    
}
