//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by hoemoon on 2019/09/23.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine: Equatable {
	static func == (lhs: MyLine, rhs: MyLine) -> Bool {
		return lhs.pointA.hash == rhs.pointA.hash
			&& lhs.pointB.hash == rhs.pointB.hash
	}
	let pointA: PointRepresentable
	let pointB: PointRepresentable
	
    static var empty: MyLine {
        MyLine(pointA: MyPoint.empty, pointB: MyPoint.empty)
    }

}


extension MyLine: Displayable {
    private var distance: Double {
        let xDistance = Double(pointA.x - pointB.x)
        let yDistance = Double(pointA.y - pointB.y)
        return (xDistance * xDistance + yDistance * yDistance).squareRoot()
    }

    var message: String {
        return "두 점 사이의 거리는 \(distance)"
    }
    
	var points: [PointRepresentable] {
		return [pointA, pointB]
	}
}
