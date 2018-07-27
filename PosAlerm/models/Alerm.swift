//
//  Alerm.swift
//  PosAlerm
//
//  Created by 竹尾広章 on 2018/07/27.
//  Copyright © 2018年 竹尾広章. All rights reserved.
//

import Foundation
import RealmSwift

class Alerm: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var datetime: Date = Date()
    @objc dynamic var title: String = ""
    @objc dynamic var isEnable: Bool = false
    @objc dynamic var updatedAt: Date? = nil
    
    override class func primaryKey() -> String {
        return "id"
    }
}
