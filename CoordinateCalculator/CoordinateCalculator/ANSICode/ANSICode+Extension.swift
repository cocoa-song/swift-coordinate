//
//  ANSICode+Point.swift
//  CoordinateCalculator
//
//  Created by hoemoon on 2019/09/22.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

extension ANSICode {
	private static func makePoint(geometry: PointRepresentable) -> String {
		var point = ANSICode.cursor.move(row:geometry.y, col: geometry.x)
		point += "🤩"
		return point
	}
	
	static func makeFigure(
		points: [PointRepresentable]) -> String {
		
		var result = ""
		for point in points {
			result += makePoint(geometry: point)
		}
		return result
	}
}

