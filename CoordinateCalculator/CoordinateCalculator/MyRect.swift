//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by oingbong on 2018. 7. 31..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect:ShapeProtocol {
    
    private var leftTop = MyPoint()
    private var rightBottom = MyPoint()
    
    init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        let width = size.width
        let height = size.height
        let valueX = Int(width) + origin.valueX
        let valueY = Int(height) + origin.valueY
        self.rightBottom = MyPoint.init(x: valueX , y: valueY)
    }
    
    private func area() -> Int {
        let width = self.rightBottom.valueX - self.leftTop.valueX
        let height = self.rightBottom.valueY - self.leftTop.valueY
        return width * height
    }

    public func message() -> String {
        return "사각형 넓이는 \(area())"
    }
    
}
