//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by hoemoon on 2019/09/24.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle: Equatable {
	static func == (lhs: MyTriangle, rhs: MyTriangle) -> Bool {
		return lhs.pointA.hash == rhs.pointA.hash
			&& lhs.pointB.hash == rhs.pointB.hash
			&& lhs.pointC.hash == rhs.pointC.hash
	}
	
	var pointA: PointRepresentable
	var pointB: PointRepresentable
	var pointC: PointRepresentable
	
	var points: [PointRepresentable] {
		return [pointA, pointB, pointC]
	}
}

extension MyTriangle {
    private var lineADistance: Double {
        return Double.distance(pointA: pointA, pointB: pointB)
    }
    private var lineBDistance: Double {
        return Double.distance(pointA: pointB, pointB: pointC)
    }
    private var lineCDistance: Double {
        return Double.distance(pointA: pointC, pointB: pointA)
    }

	private var cosB: Double {
		let top = lineADistance * lineADistance
			+ lineCDistance * lineCDistance
			- lineBDistance * lineBDistance
		let bottom = 2 * lineADistance * lineCDistance
		return top / bottom
	}
	
	private var sinB: Double {
		return (1 - cosB * cosB).squareRoot()
	}
}

extension MyTriangle: Displayable {
    private var area: Double {
        return lineADistance * lineCDistance * sinB / 2
    }

    var message: String {
        return "삼각형 넓이는 \(area)"
    }
}
