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
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: self.bounds.midX))   // 始点
        path.addLine(to: CGPoint(x: self.bounds.maxX, y: self.bounds.midX)) //　終点
        path.close()
        UIColor.black.setStroke()
        path.lineWidth = 1
        path.stroke()       // 描画
    }

}
