//
//  Model.swift
//  MVCtest
//
//  Created by 福山帆士 on 2020/05/05.
//  Copyright © 2020 福山帆士. All rights reserved.
//

import Foundation

// Model
class Model {
    let notificationCenter = NotificationCenter()
    private(set) var count = 0 {
        didSet {
            notificationCenter.post(name: .init(rawValue: "count"), object: nil, userInfo: ["count": count])
        }
    }
    func countDown() { count -= 1}
    func countUp() { count += 1}
}
