//
//  CustomView.swift
//  MVCtest
//
//  Created by 福山帆士 on 2020/05/08.
//  Copyright © 2020 福山帆士. All rights reserved.
//

import UIKit

//View。レイアウトの処理はViewにて行う。
final class CustomView: UIView {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    // xibを使用する場合の処理。
    func loadNib() {
        if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
        view.frame = self.bounds
        self.addSubview(view)
    }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
