//
//  Double.swift
//  CoordinateCalculator
//
//  Created by cocoa on 25/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

extension Double {
    static func distance(pointA: PointRepresentable, pointB: PointRepresentable) -> Double {
        let xDistance = Double(pointA.x - pointB.x)
        let yDistance = Double(pointA.y - pointB.y)
        return (xDistance * xDistance + yDistance * yDistance).squareRoot()
    }
}
