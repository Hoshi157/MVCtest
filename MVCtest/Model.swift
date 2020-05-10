//
//  Model.swift
//  MVCtest
//
//  Created by 福山帆士 on 2020/05/05.
//  Copyright © 2020 福山帆士. All rights reserved.
//

import Foundation

// Model
final class Model {
    let notificationCenter = NotificationCenter()
    private(set) var count = 0 {
        // プロパティを監視。格納後に呼ばれる。
        didSet {
            print("modelDid")
            // 通知を送る。userInfoはデータを送る。
            notificationCenter.post(name: .init(rawValue: "count"), object: nil, userInfo: ["count": count])
        }
    }
    func countDown() {
        count -= 1
        print("modelDwon")
    }
    func countUp() { count += 1}
}
