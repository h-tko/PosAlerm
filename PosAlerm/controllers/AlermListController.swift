//
//  AlermListController.swift
//  PosAlerm
//
//  Created by 竹尾広章 on 2018/07/19.
//  Copyright © 2018年 竹尾広章. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialCollections

class AlermListController: MDCCollectionViewController {

    var alermList: [Alerm] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        styler.cellStyle = .card
        
        loadData()
    }
    
    func loadData() {
        let list = AlermRepository().all()
        alermList = list.map { $0 }
    }
}

// MARK: UICollectionViewDataSource
extension AlermListController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return alermList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeCollectionViewCell", for: indexPath) as! AlermCollectionViewCell
        cell.timeLabel?.text = alermList[indexPath.item].datetime.toString()
        cell.titleLabel?.text = alermList[indexPath.item].title
        
        return cell
    }
}
