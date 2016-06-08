//
//  Group.swift
//  BlueCap
//
//  Created by 박재유 on 2016. 6. 1..
//  Copyright © 2016년 Troy Stribling. All rights reserved.
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
    
    //var GROUP_MEMBER_SEQ: String = String()
    var GROUP_MEMBER_NM: String = String()
    var GROUP_MEMBER_VALUE: String = String()
}

class BrainMember: NSObject {
    var USER_ID: String = String()
    var GROUP_SEQ: String = String()
    var GROUP_MEMBER_SEQ: String = String()
    var GROUP_MEMBER_NM: String = String()
    var RELATIONSHIP_SCORE: String = String()
}