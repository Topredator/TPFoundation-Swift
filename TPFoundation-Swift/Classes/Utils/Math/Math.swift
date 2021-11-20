//
//  Math.swift
//  TPFoundation-Swift
//
//  Created by Topredator on 2021/11/20.
//

import Foundation


public class Math {
    
    @discardableResult
    /// 弧度转化为 度
    /// - Parameter radian: 弧度
    /// - Returns: 度
    public class func DegreeFromRadian(_ radian: CGFloat) -> CGFloat {
        radian * (180.0 / CGFloat(Double.pi))
    }
    
    @discardableResult
    /// 度 转化为 弧度
    /// - Parameter degree: 度
    /// - Returns: 弧度
    public class func RadianFromDegree(_ degree: CGFloat) -> CGFloat {
        degree * CGFloat(Double.pi) / 180.0
    }
    
    // MARK:  ------------- 计算弧度 --------------------
    @discardableResult
    /// 通过正切函数计算 弧度
    public class func RadianFromTanSide(sideA: CGFloat, sideB: CGFloat) -> CGFloat {
        atan2(sideA, sideB)
    }
    @discardableResult
    public class func ResetFromSize(_ size: CGSize, withFixedWidth: CGFloat) -> CGSize {
        let height = size.height * (withFixedWidth / size.width)
        return CGSize(width: withFixedWidth, height: height)
    }
    @discardableResult
    public class func ResetFromSize(_ size: CGSize, withFixedHeight: CGFloat) -> CGSize {
        let width = size.width * (withFixedHeight / size.height)
        return CGSize(width: width, height: withFixedHeight)
    }
    
    // MARK:  ------------- Y = kX + b --------------------
    var k: CGFloat!
    var b: CGFloat!
    public convenience init(_ pointA: (CGFloat, CGFloat), _ pointB: (CGFloat, CGFloat)) {
        self.init()
        k = calculateSlope(x1: pointA.0, y1: pointA.1, x2: pointB.0, y2: pointB.1)
        b = calculateConstant(x1: pointA.0, y1: pointA.1, x2: pointB.0, y2: pointB.1)
    }
    
    @discardableResult
    /// 通过Y值 求X值
    public func xValueWhenYEqual(_ yValue : CGFloat) -> CGFloat {
        if k == 0 { return 0 }
        return (yValue - b) / k
    }
    
    @discardableResult
    /// 通过y值 与 斜率 求坐标点point
    public func whenYEqual(_ yValue : CGFloat) -> (x : CGFloat, y : CGFloat) {
        if k == 0 { return (0, yValue) }
        return ((yValue - b) / k, yValue)
    }
    
    @discardableResult
    /// 通过X坐标值 与 斜率 求Y坐标的值
    public func yValueWhenXEqual(_ xValue : CGFloat) -> CGFloat {
        k * xValue + b
    }
    
    @discardableResult
    /// 通过 X坐标 及 斜率 求 坐标点point
    public func whenXEqual(_ xValue : CGFloat) -> (x : CGFloat, y : CGFloat) {
        (xValue, k * xValue + b)
    }
    
    @discardableResult
    fileprivate func calculateSlope(x1 : CGFloat, y1 : CGFloat, x2 : CGFloat, y2 : CGFloat) -> CGFloat {
        if x1 == x2 { return 0 }
        return (y2 - y1) / (x2 - x1)
    }
    
    @discardableResult
    fileprivate func calculateConstant(x1 : CGFloat, y1 : CGFloat, x2 : CGFloat, y2 : CGFloat) -> CGFloat {
        if x1 == x2 { return 0 }
        return (y1*(x2 - x1) - x1*(y2 - y1)) / (x2 - x1)
    }
}
