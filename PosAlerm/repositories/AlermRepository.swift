//
//  AlermRepository.swift
//  PosAlerm
//
//  Created by 竹尾広章 on 2018/07/27.
//  Copyright © 2018年 竹尾広章. All rights reserved.
//

import Foundation
import RealmSwift

class AlermRepository {
    private let realm: Realm
    
    init() {
        try! realm = Realm()
    }

    func save(alerm: Alerm) {
        if alerm.updatedAt == nil {
            alerm.updatedAt = Date()
        }
        
        try! realm.write {
            realm.add(alerm)
        }
    }

    func all() -> Results<Alerm> {
        return realm.objects(Alerm.self).sorted(byKeyPath: "id", ascending: false)
    }

}
