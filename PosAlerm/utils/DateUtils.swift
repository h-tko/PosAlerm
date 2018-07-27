//
//  DateUtils.swift
//  PosAlerm
//
//  Created by 竹尾広章 on 2018/07/27.
//  Copyright © 2018年 竹尾広章. All rights reserved.
//

import Foundation

public extension Date {
    public func toString() -> String {
        let format = DateFormatter()
        format.timeStyle = .short
        format.dateStyle = .short
        format.locale = Locale(identifier: "ja_JP")
        
        return format.string(from: self)
    }
}
