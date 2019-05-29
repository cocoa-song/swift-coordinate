//
//  CoordinateCalculatorTest.swift
//  CoordinateCalculatorTest
//
//  Created by 이희찬 on 21/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class CoordinateCalculatorTest: XCTestCase {
    var converter: Converter!
    override func setUp() {
        converter = Converter()
    }
    
    func testCorrectFormatOfPoint() {
        XCTAssertNoThrow(try converter.convertToPoints("(0,0)", Validator()))
    }
    
    func testCorrectFormatOfLine() {
        XCTAssertNoThrow(try converter.convertToPoints("(0,0)-(0,0)", Validator()))
    }
    
    func testCorrectFormatOfTriangle() {
        XCTAssertNoThrow(try converter.convertToPoints("(0,0)-(0,0)-(0,0)", Validator()))
    }
    
    func testCorrectFormatOfRect() {
        XCTAssertNoThrow(try converter.convertToPoints("(0,0)-(0,0)-(0,0)-(0,0)", Validator()))
    }
    
    func testInCorrectFormatOfPoint() {
        XCTAssertThrowsError(try converter.convertToPoints("0,0", Validator()))
    }
    
    func testInCorrectFormatOfPointSeperator() {
        XCTAssertThrowsError(try converter.convertToPoints("(0,0)(0,0)", Validator()))
    }
    
    func testOverFourItem() {
        XCTAssertThrowsError(try converter.convertToPoints("(0,0)-(0,0)-(0,0)-(0,0)-(0,0)", Validator()))
    }
    
    func testLineNotConsistOfOneItem() {
        XCTAssertThrowsError(try converter.convertToPoints("(0,0)-", Validator()))
    }
    
    func testCoordinateConsistOfTwoItem() {
        XCTAssertNoThrow(try converter.convertToPoints("(0,0)", Validator()))
    }
    
    func testCoordinateNotConsistOfTwoItem() {
        XCTAssertThrowsError(try converter.convertToPoints("(0,0,0)", Validator()))
    }
    
    func testCoordinateCanConvertToInt() {
        XCTAssertNoThrow(try converter.convertToPoints("(0,0)", Validator()))
    }
    
    func testCoordinateCanNotConvertToInt() {
        XCTAssertThrowsError(try converter.convertToPoints("(zero,zero)", Validator()))
    }
    
    func testCoordinateMoreThanZero() {
        XCTAssertNoThrow(try converter.convertToPoints("(0,0)", Validator()))
    }
    
    func testCoordinateBelowZero() {
        XCTAssertThrowsError(try converter.convertToPoints("(-1,-1)", Validator()))
    }
    
    func testCoordinateUnderTwentyFour() {
        XCTAssertNoThrow(try converter.convertToPoints("(24,24)", Validator()))
    }
    
    func testCoordinateExcessTwentyFour() {
        XCTAssertThrowsError(try converter.convertToPoints("(25,25)", Validator()))
    }
    
    func testCanDrawLine() {
        XCTAssertThrowsError(try Validator.canDrawLine(line: MyLine(pointA: MyPoint(x: 5, y: 5), pointB: MyPoint(x: 5, y: 5))))
    }

    func testCanDrawTriangle() {
        XCTAssertThrowsError(try Validator.canDrawTriangle(triangle: MyTriangle(pointA: MyPoint(x: 5, y: 5), pointB: MyPoint(x: 2, y: 2), pointC: MyPoint(x: 9, y: 9))))
    }

}
