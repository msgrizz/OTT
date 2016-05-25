//
//  Group.swift
//  DataBaseDemo
//
//  Created by Krupa-iMac on 05/08/14.
//  Copyright (c) 2014 TheAppGuruz. All rights reserved.
//

import UIKit

class Group: NSObject {
    
    var USER_ID: String = String()
    var GROUP_SEQ: String = String()
    var GROUP_ICON_FILE_NM: String = String()
    var GROUP_NM: String = String()
    var GROUP_VALUE: String = String()
}

class GroupMember: NSObject {
    
    var GROUP_MEMBER_SEQ: String = String()
    var GROUP_MEMBER_NM: String = String()
    var GROUP_MEMBER_VALUE: String = String()
}