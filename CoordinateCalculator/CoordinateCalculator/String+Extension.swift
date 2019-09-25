//
//  String+Extension.swift
//  CoordinateCalculator
//
//  Created by hoemoon on 2019/09/22.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

extension String {
	func matches(regex: String) -> [String] {
		guard let regex = try? NSRegularExpression(pattern: regex) else {
			fatalError()
		}
		let results = regex.matches(
			in: self,
			range: NSRange(self.startIndex..., in: self)
		)
		return results.map {
			String(self[Range($0.range, in: self)!])
		}
	}
    
    var numbers: [Int] {
        return self.matches(regex: #"(\d+)"#)
            .compactMap { Int($0) }
            .filter { $0 < 25 && $0 > 0 }
    }
}
