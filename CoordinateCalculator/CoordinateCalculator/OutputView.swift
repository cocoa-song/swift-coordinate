//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by hoemoon on 2019/09/22.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Displayable {
	var points: [PointRepresentable] { get }
    var message: String { get }
}

struct OutputView {
	static func display(_ displayable: Displayable) {
        display(figure: ANSICode.makeFigure(points: displayable.points))
        display(message: displayable.message)
	}
	
	private static func display(figure: String) {
		print("\(ANSICode.clear)\(ANSICode.home)")
		print(figure)
		print("\(ANSICode.text.white)\(ANSICode.axis.draw())")
	}
    
    private static func display(message: String) {
        print(message)
    }
}
