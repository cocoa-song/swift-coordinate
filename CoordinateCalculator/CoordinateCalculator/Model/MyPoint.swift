//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by hoemoon on 2019/09/22.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol PointRepresentable {
	var x: Int { get }
	var y: Int { get }
}

extension PointRepresentable {
	var hash: Int {
		return x.hashValue * y.hashValue
	}
    var transformed: PointRepresentable {
        let newY = 25 - self.y
        let newX = 3 + self.x * 2
        return MyPoint(x: newX, y: newY)
    }

}

struct MyPoint: PointRepresentable {
	let x: Int
	let y: Int
		
	init(x: Int, y: Int) {
		self.x = x
		self.y = y
	}
	    
    static var empty: PointRepresentable {
        return MyPoint(x: 0, y: 0)
    }

}

extension MyPoint: Comparable {
	static func < (lhs: MyPoint, rhs: MyPoint) -> Bool {
		return lhs.x == rhs.x && lhs.y == rhs.y
	}
}


extension MyPoint: Displayable {
    var points: [PointRepresentable] {
        return [self]
    }

    var message: String {
        return ""
    }
}
