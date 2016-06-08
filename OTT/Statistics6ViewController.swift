//
//  Statistics6ViewController.swift
//  OTT
//
//  Created by 박재유 on 2016. 6. 9..
//  Copyright © 2016년 Troy Stribling. All rights reserved.
//

import UIKit

class Statistics6ViewController: UIViewController {

    @IBOutlet weak var whospent: UILabel!
    @IBOutlet weak var howmanytime: UILabel!
    
    var timeToPass:String = String()
    var nameToPass:String = String()
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //print("First VC will appear")
        
        self.whospent.text! = nameToPass
        self.howmanytime.text! = timeToPass
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        //print("First VC will disappear")
    }
}
