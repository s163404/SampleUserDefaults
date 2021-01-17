//
//  BorderLineView.swift
//  SampleUserDefaults
//
//  Created by 冨田康介 on 2021/01/16.
//  Copyright © 2021 kosuketomita. All rights reserved.
//

import UIKit

/// 横線を描くUIView
class BorderLineView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: self.bounds.midY))   // 始点
        path.addLine(to: CGPoint(x: self.bounds.maxX, y: self.bounds.midY)) //　終点
        path.close()
        UIColor.black.setStroke()
        path.lineWidth = 10
        path.stroke()       // 描画
    }

}
