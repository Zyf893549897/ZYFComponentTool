//
//  TimeTool.swift
//  Common
//
//  Created by issuser on 2022/4/14.
//

import UIKit
/// 时间类型RowValue
public enum TimeFormat:String {
    case YYYYMMDD = "yyyy-MM-dd"
    case YYYYMMDDHH = "yyyy-MM-dd HH"
    case YYYYMMDDHHMM = "yyyy-MM-dd HH:mm"
    case YYYYMMDDHHMMSS = "yyyy-MM-dd HH:mm:ss"
    case YYYYMMDDHHMMSSsss = "yyyy-MM-dd HH:mm:ss.SSS"
}

open class TimeTool: NSObject {
    /// 字符串时间转时间戳
    /// - Parameters:
    ///   - timeFormat: 时间格式
    ///   - timeString: 要转的字符串时间
    public static func timeToTimestamp(timeFormat:TimeFormat,timeString:String) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.dateFormat = timeFormat.rawValue
        let timezone = TimeZone.init(identifier: "Asia/Beijing")
        formatter.timeZone = timezone
        let dateTime = formatter.date(from: timeString)
        return String(dateTime!.timeIntervalSince1970)
    }
    /// 将时间戳转为时间
    /// - Parameters:
    ///   - timeFormat: 时间类型
    ///   - timeString: 时间戳
    public static func getTimeFromTimestamp(timeFormat:TimeFormat,timeString:String) -> String {
        let newTime = Int(timeString)! / 1000
        let myDate = NSDate.init(timeIntervalSince1970: TimeInterval(newTime))
        let formatter = DateFormatter()
        formatter.dateFormat = timeFormat.rawValue
        let timeString = formatter.string(from: myDate as Date)
        return timeString
    }

    /// 获取当前时间
    /// - Parameter timeFormat: 时间类型，TimeFormat为枚举
    public static func getCurrentTime(timeFormat:TimeFormat) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = timeFormat.rawValue
        let timezone = TimeZone.init(identifier: "Asia/Beijing")
        formatter.timeZone = timezone
        let dateTime = formatter.string(from: Date.init())
        return dateTime
    }

    /// 比较两个时间的大小
    /// - Parameters:
    ///   - timeFormat: 时间格式
    ///   - date1: 时间1
    ///   - date2: 时间2
    public static func compareDate(timeFormat:TimeFormat,date1:String,date2:String) -> Int {
        var ci = Int()
        let formatter = DateFormatter()
        formatter.dateFormat = timeFormat.rawValue
        var dt1 = NSDate.init()
        var dt2 = NSDate.init()
        dt1 = formatter.date(from: date1)! as NSDate
        dt2 = formatter.date(from: date2)! as NSDate
        let result = dt1.compare(dt2 as Date)
        switch result {
        case .orderedAscending: //升序排列
            ci = 1
        case .orderedDescending: //降序排列
            ci = -1
        case .orderedSame:  //相等
            ci = 0
        default:
            break
        }
        return ci
    }
}
