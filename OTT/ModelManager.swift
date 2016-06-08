//
//  ModelManager.swift
//  BlueCap
//
//  Created by 박재유 on 2016. 6. 1..
//  Copyright © 2016년 Troy Stribling. All rights reserved.
//


import UIKit

let sharedInstance = ModelManager()

class ModelManager: NSObject {
    
    var database: FMDatabase? = nil
    
    class func getInstance() -> ModelManager
    {
        if(sharedInstance.database == nil)
        {
            sharedInstance.database = FMDatabase(path: Util.getPath("ott_db.sqlite"))
        }
        return sharedInstance
    }
    
    func addGroupData(groupInfo: Group) -> Bool {
        sharedInstance.database!.open()
        let isInserted = sharedInstance.database!.executeUpdate("INSERT INTO group_detail (GROUP_NM, GROUP_ICON_FILE_NM, USER_ID ) VALUES (?, ?, ?)", withArgumentsInArray: [groupInfo.GROUP_NM , groupInfo.GROUP_ICON_FILE_NM, 1000000001])
        sharedInstance.database!.close()
        return isInserted
    }
    
    func addMemberData(memberInfo: GroupMember) -> Bool {
        sharedInstance.database!.open()
        let isInserted = sharedInstance.database!.executeUpdate("INSERT INTO group_member (GROUP_MEMBER_NM, GROUP_MEMBER_VALUE, GROUP_SEQ, USER_ID ) VALUES (?, ?, ?, ?)", withArgumentsInArray: [memberInfo.GROUP_MEMBER_NM , memberInfo.GROUP_MEMBER_VALUE, 3, 1000000001])
        sharedInstance.database!.close()
        return isInserted
    }
    
    func updateGroupData(groupInfo: Group) -> Bool {
        sharedInstance.database!.open()
        let isUpdated = sharedInstance.database!.executeUpdate("UPDATE group_detail SET GROUP_NM=?, WHERE GROUP_SEQ=?", withArgumentsInArray: [groupInfo.GROUP_NM, groupInfo.GROUP_VALUE, groupInfo.GROUP_SEQ])
        sharedInstance.database!.close()
        return isUpdated
    }
    
    func getGroupMemberData(Group_SEQ: Int) -> NSMutableArray {
        sharedInstance.database!.open()
        var resultSet: FMResultSet!
        if(Group_SEQ == 9999)
        {
            resultSet = sharedInstance.database!.executeQuery("SELECT GROUP_MEMBER_NM, GROUP_MEMBER_VALUE FROM GROUP_MEMBER ORDER BY GROUP_MEMBER_VALUE DESC, GROUP_MEMBER_NM", withArgumentsInArray: nil)
        }
        else
        {
            resultSet = sharedInstance.database!.executeQuery("select * from group_member WHERE GROUP_SEQ=?", withArgumentsInArray: [String(Group_SEQ)])
        }
        let marrFriendInfo : NSMutableArray = NSMutableArray()
        if (resultSet != nil) {
            while resultSet.next() {
                let GroupMemberInfo : GroupMember = GroupMember()
                GroupMemberInfo.GROUP_MEMBER_NM = resultSet.stringForColumn("GROUP_MEMBER_NM")
                GroupMemberInfo.GROUP_MEMBER_VALUE = resultSet.stringForColumn("GROUP_MEMBER_VALUE")
                
                marrFriendInfo.addObject(GroupMemberInfo)
            }
        }
        sharedInstance.database!.close()
        return marrFriendInfo
    }
    
    func getAllMemberAverage() -> Float{
        sharedInstance.database!.open()
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("select avg(group_member_value) as ave from group_member", withArgumentsInArray: nil)
        var ave:Float = 0
        if (resultSet != nil) {
            while resultSet.next() {
                ave = Float(resultSet.stringForColumn("ave"))!
                
            }
        }
        sharedInstance.database!.close()
        print("\(ave)")
        return (round(100*ave)/100)
    }
    

    
    func deleteGroupData(groupInfo: Group) -> Bool {
        sharedInstance.database!.open()
        let isDeleted = sharedInstance.database!.executeUpdate("DELETE FROM group_detail WHERE GROUP_SEQ=?", withArgumentsInArray: [groupInfo.GROUP_SEQ])
        sharedInstance.database!.close()
        return isDeleted
    }
    
    func getAllGroupData() -> NSMutableArray {
        sharedInstance.database!.open()
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT  A.USER_ID, A.GROUP_SEQ, A.GROUP_ICON_FILE_NM, A.GROUP_NM, PRINTF(\"%.2f\",IFNULL((SELECT  AVG(GROUP_MEMBER_VALUE) FROM    GROUP_MEMBER WHERE USER_ID = A.USER_ID AND GROUP_SEQ = A.GROUP_SEQ GROUP BY USER_ID, GROUP_SEQ), 0))   AS GROUP_VALUE FROM  GROUP_DETAIL A", withArgumentsInArray: nil)
        let marrGroupInfo : NSMutableArray = NSMutableArray()
        if (resultSet != nil) {
            while resultSet.next() {
                let groupInfo : Group = Group()
                groupInfo.USER_ID = resultSet.stringForColumn("USER_ID")
                groupInfo.GROUP_SEQ = resultSet.stringForColumn("GROUP_SEQ")
                groupInfo.GROUP_ICON_FILE_NM = resultSet.stringForColumn("GROUP_ICON_FILE_NM")
                groupInfo.GROUP_NM = resultSet.stringForColumn("GROUP_NM")
                //let floatValue:Float = resultSet.stringForColumn("GROUP_VALUE").floatValue
                groupInfo.GROUP_VALUE = resultSet.stringForColumn("GROUP_VALUE") //String(format: "%.2f", floatValue)
                //print(groupInfo.GROUP_VALUE)
                marrGroupInfo.addObject(groupInfo)
            }
        }
        sharedInstance.database!.close()
        return marrGroupInfo
    }
    
    func getBrainAllData() -> NSMutableArray {
        sharedInstance.database!.open()
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT  A.USER_ID, A.GROUP_SEQ, A.GROUP_MEMBER_SEQ, A.GROUP_MEMBER_NM, TOTAL(A.GROUP_MEMBER_VALUE * (STRFTIME('%s', B.END_TIME) - STRFTIME('%s', B.START_TIME)) / 60 / (B.SPACE_TPCD * B.SPACE_TPCD)) AS RELATIONSHIP_SCORE FROM    GROUP_MEMBER A, MEETING B WHERE   A.USER_ID = B.USER_ID AND     A.GROUP_SEQ = B.GROUP_SEQ AND     A.GROUP_MEMBER_SEQ = B.GROUP_MEMBER_SEQ GROUP BY  A.USER_ID, A.GROUP_SEQ, A.GROUP_MEMBER_SEQ ORDER BY  RELATIONSHIP_SCORE DESC, B.END_TIME DESC, A.GROUP_MEMBER_NM, A.USER_ID, A.GROUP_SEQ, A.GROUP_MEMBER_SEQ", withArgumentsInArray: nil)
        let marrBrainInfo : NSMutableArray = NSMutableArray()
        if (resultSet != nil) {
            while resultSet.next() {
                let brainInfo : BrainMember = BrainMember()
                brainInfo.USER_ID = resultSet.stringForColumn("USER_ID")
                brainInfo.GROUP_SEQ = resultSet.stringForColumn("GROUP_SEQ")
                brainInfo.GROUP_MEMBER_SEQ = resultSet.stringForColumn("GROUP_MEMBER_SEQ")
                brainInfo.GROUP_MEMBER_NM = resultSet.stringForColumn("GROUP_MEMBER_NM")
                brainInfo.RELATIONSHIP_SCORE = resultSet.stringForColumn("RELATIONSHIP_SCORE")
                marrBrainInfo.addObject(brainInfo)
            }
        }
        sharedInstance.database!.close()
        return marrBrainInfo
    }
    
}
