//
//  StatisticsViewController.swift
//  OTT
//
//  Created by 박재유 on 2016. 6. 4..
//  Copyright © 2016년 Troy Stribling. All rights reserved.
//


import UIKit

class StatisticsViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var textLabel: UILabel!
    
    /* Creating the UISegmented Control programatically
     
     //    var segmentedControl:UISegmentedControl!
     
     override func viewDidLoad() {
     super.viewDidLoad()
     // Do any additional setup after loading the view, typically from a nib.
     segmentedControl = UISegmentedControl (items: ["First","Second","Third"])
     segmentedControl.frame = CGRectMake(60, 250,200, 30)
     segmentedControl.selectedSegmentIndex = 0
     segmentedControl.addTarget(self, action: "segmentedControlAction:", forControlEvents: .ValueChanged)
     self.view.addSubview(segmentedControl)
     }
     
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //navigation bar style
        let font = UIFont(name:"Thonburi", size:20.0)
        var titleAttributes : [String:AnyObject]
        if let defaultTitleAttributes = UINavigationBar.appearance().titleTextAttributes {
            titleAttributes = defaultTitleAttributes
        } else {
            titleAttributes = [String:AnyObject]()
        }
        titleAttributes[NSFontAttributeName] = font
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
        //
        textLabel.text = "Daily Segment Selected";
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func segmentedControlAction(sender: AnyObject) {
        
        if(segmentedControl.selectedSegmentIndex == 0)
        {
            textLabel.text = "Daily Segment Selected";
        }
        else if(segmentedControl.selectedSegmentIndex == 1)
        {
            textLabel.text = "Weekly Segment Selected";
        }
        else if(segmentedControl.selectedSegmentIndex == 2)
        {
            textLabel.text = "Monthly Segment Selected";
        }
        else if(segmentedControl.selectedSegmentIndex == 3)
        {
            textLabel.text = "Lifetime Segment Selected";
        }
    }
}

