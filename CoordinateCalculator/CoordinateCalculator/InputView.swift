//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Huan Suh on 2018. 7. 8..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    let limit = ANSICode.axis.AxisLimit
    let outputView = OutputView.init()
    
    public func inputFigure() {
        print("입력 도형을 선택하세요 : (1.Point 2.Line 3.Triangle 4.Rect)")
        let num = Int(readLine()!) ?? -1
        inputFigure(num)
    }
    
    public func inputFigure(_ num : Int) {
        switch num {
        case 1:
            inputPoint()
        case 2:
            inputLine()
        case 3:
            inputTriangle()
        case 4:
            inputRect()
        default:
            printInputError()
        }
    }
    
    private func inputPoint() {
        print("좌표를 입력하세요")
        let point = parseInput(input: readLine())
        if(point != nil && point?.count == 1) {
            outputView.printFigure(figure: point![0])
        } else {
            printInputError()
        }
    }
    
    private func inputLine() {
        print("좌표를 입력하세요")
        let point = parseInput(input: readLine())
        if(point != nil && point?.count == 2) {
            outputView.printFigure(figure: MyFigures.MyLine(p1:point![0], p2:point![1]))
        } else {
            printInputError()
        }
    }
    
    private func inputTriangle() {
        
    }
    
    private func inputRect() {
        
    }
    
    private func parseInput(input : String?) -> [MyFigures.MyPoint]? {
        if(input == nil) {
            return nil
        }
        
        var points = [MyFigures.MyPoint]()
        let strPoints = input?.split(separator: "-")
        if(strPoints != nil) {
            for strPt in strPoints! {
                let pts = strPt.replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "")
                let strCoords = pts.split(separator: ",")
                if(strCoords.count == 2) {
                    let x = Int(strCoords[0]) ?? -1
                    let y = Int(strCoords[1]) ?? -1
                    points.append(MyFigures.MyPoint(x:x, y:y))
                }
            }
            return points
        }
        return nil
    }
    
    private func printInputError() {
        print("잘못된 입력값입니다.")
        inputFigure()
    }
}
