//
//  Calculator.swift
//  CoordinateCalculator
//
//  Created by hoemoon on 2019/09/22.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum CalculatorError: Error {
	case failedToCreatePoint
	case failedToCreateLine
	case failedToCreateTriangle
	case wrongInput
	
	var message: String {
		switch self {
		case .failedToCreateLine:
			return "failed To Create Line"
		case .failedToCreatePoint:
			return "failed To Create Point"
		case .failedToCreateTriangle:
			return "failed To Create Triangle"
		case .wrongInput:
			return "wrong input"
		}
	}
}

struct Calculator {
	static func makeDisplayable(from text: String) throws -> Displayable {
		if let point = try? makePoint(from: text) {
			return point
		}
		if let line = try? makeLine(from: text) {
			return line
		}
		if let triangle = try? makeTriangle(from: text) {
			return triangle
		}
		throw CalculatorError.wrongInput
	}
	
	static func transform(_ displayable: Displayable) -> Displayable {
        switch displayable.points.count {
        case 1:
            let transformed = displayable.points[0].transformed
            return MyPoint(
                x: transformed.x,
                y: transformed.y
            )
        case 2:
            return MyLine(
                pointA: displayable.points[0].transformed,
                pointB: displayable.points[1].transformed
            )
        case 3:
            return MyTriangle(
                pointA: displayable.points[0].transformed,
                pointB: displayable.points[1].transformed,
                pointC: displayable.points[2].transformed
            )
        default:
            fatalError()
        }
	}
}

extension Calculator {
	static private func makePoint(from text: String) throws -> Displayable {
		let matches = text.matches(regex: #"(\d+)"#)
		guard matches.count == 2 else {
			throw CalculatorError.failedToCreatePoint
		}
		guard text.numbers.count == 2 else {
			throw CalculatorError.failedToCreatePoint
		}
		return MyPoint(x: text.numbers[0], y: text.numbers[1])
	}
	
	static private func makeLine(from text: String) throws -> Displayable {
		let matches = text.matches(regex: #"\(\d+\,\d+\)\-\(\d+\,\d+\)"#)
		guard matches.count == 1 else {
			throw CalculatorError.failedToCreateLine
		}
		guard text.numbers.count == 4 else {
			throw CalculatorError.failedToCreateLine
		}
		return MyLine(
			pointA: MyPoint(x: text.numbers[0], y: text.numbers[1]),
			pointB: MyPoint(x: text.numbers[2], y: text.numbers[3])
		)
	}
	
	static private func makeTriangle(from text: String) throws -> Displayable {
		let matches = text.matches(regex: #"\(\d+\,\d+\)\-\(\d+\,\d+\)-\(\d+\,\d+\)"#)
		guard matches.count == 1 else {
			throw CalculatorError.failedToCreateTriangle
		}
		let numbers = text.numbers
		guard numbers.count == 6 else {
			throw CalculatorError.failedToCreateTriangle
		}
		return MyTriangle(
			pointA: MyPoint(x: numbers[0], y: numbers[1]),
			pointB: MyPoint(x: numbers[2], y: numbers[3]),
			pointC: MyPoint(x: numbers[4], y: numbers[5])
		)
	}
	
	private static func transform(point: PointRepresentable) -> PointRepresentable {
		let newY = 25 - point.y
		let newX = 3 + point.x * 2
		return MyPoint(x: newX, y: newY)
	}
}
