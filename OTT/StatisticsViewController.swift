//
//  StatisticsViewController.swift
//  OTT
//
//  Created by 박재유 on 2016. 6. 4..
//  Copyright © 2016년 Troy Stribling. All rights reserved.
//


import UIKit

class StatisticsViewController: UIViewController {
    
    enum TabIndex : Int {
        case FirstChildTab = 0
        case SecondChildTab = 1
        case ThirdChildTab = 2
    }
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var contentView: UIView!
    
    var currentViewController: UIViewController?
    lazy var firstChildTabVC: UIViewController? = {
        let firstChildTabVC = self.storyboard?.instantiateViewControllerWithIdentifier("Statistics1ViewControllerId")
        return firstChildTabVC
    }()
    lazy var secondChildTabVC : UIViewController? = {
        let secondChildTabVC = self.storyboard?.instantiateViewControllerWithIdentifier("Statistics2ViewControllerId")
        return secondChildTabVC
    }()
    lazy var thirdChildTabVC : UIViewController? = {
        let thirdChildTabVC = self.storyboard?.instantiateViewControllerWithIdentifier("Statistics3ViewControllerId")
        return thirdChildTabVC
    }()
    
    
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        //segmentedControl.initUI()
        segmentedControl.selectedSegmentIndex = TabIndex.FirstChildTab.rawValue
        displayCurrentTab(TabIndex.FirstChildTab.rawValue)
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if let currentViewController = currentViewController {
            currentViewController.viewWillDisappear(animated)
        }
    }
    
    // MARK: - Switching Tabs Functions
    @IBAction func switchTabs(sender: UISegmentedControl) {
        self.currentViewController!.view.removeFromSuperview()
        self.currentViewController!.removeFromParentViewController()
        
        displayCurrentTab(sender.selectedSegmentIndex)
    }
    
    func displayCurrentTab(tabIndex: Int){
        if let vc = viewControllerForSelectedSegmentIndex(tabIndex) {
            
            self.addChildViewController(vc)
            vc.didMoveToParentViewController(self)
            
            vc.view.frame = self.contentView.bounds
            self.contentView.addSubview(vc.view)
            self.currentViewController = vc
        }
    }
    
    func viewControllerForSelectedSegmentIndex(index: Int) -> UIViewController? {
        var vc: UIViewController?
        switch index {
        case TabIndex.FirstChildTab.rawValue :
            vc = firstChildTabVC
        case TabIndex.SecondChildTab.rawValue :
            vc = secondChildTabVC
        case TabIndex.ThirdChildTab.rawValue :
            vc = thirdChildTabVC
        default:
            return nil
        }
        
        return vc
    }
}


