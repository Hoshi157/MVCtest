//
//  ViewController.swift
//  MVCtest
//
//  Created by 福山帆士 on 2020/05/05.
//  Copyright © 2020 福山帆士. All rights reserved.
//

import UIKit
// controller。お互い知らないViewとModelとの架け橋を担当する。
final class ViewController: UIViewController {
    
    var myModel: Model? {
        // 監視する
        didSet {
            registerModel()
        }
    }
    // Viewのインスタンス
    private(set) lazy var myView: CustomView = CustomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = myView
        // Modelのインスタンスを代入する!
        myModel = Model()
        // Do any additional setup after loading the view.
    }
    
    deinit {
        myModel?.notificationCenter.removeObserver(self)
    }
    
    private func registerModel() {
        guard let model = myModel else {return}
        // ModelのcountをtextLabelに表示
        myView.textLabel.text = model.count.description
        myView.minusButton.addTarget(self, action: #selector(onMinusTapped), for: .touchUpInside)
        myView.plusButton.addTarget(self, action: #selector(onPlusTapped), for: .touchUpInside)
        //　データを受け取る
        model.notificationCenter.addObserver(forName: .init(rawValue: "count"), object: nil, queue: nil, using: { [unowned self] notigication in
            // userInfoからcountのデータを受け取り変数へ
            if let count = notigication.userInfo?["count"] as? Int {
                self.myView.textLabel.text = "\(count)"
            }
            
        })
        
    }
    
    @objc func onMinusTapped() { myModel?.countDown() }
    @objc func onPlusTapped() { myModel?.countUp() }

}

