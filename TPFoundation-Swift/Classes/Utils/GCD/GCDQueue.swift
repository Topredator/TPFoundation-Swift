//
//  GCDQueue.swift
//  TPFoundation-Swift
//
//  Created by Topredator on 2021/11/20.
//

import Foundation

public class GCDQueue {
    public let dispatchQueue: DispatchQueue
    init(dispatchQueue: DispatchQueue) {
        self.dispatchQueue = dispatchQueue
    }
    /// 主线程
    public class var Main: GCDQueue {
        GCDQueue(dispatchQueue: DispatchQueue.main)
    }
    
    /// 获取子线程
    /// - Parameter priority: 优先级
    /// - Returns: 子线程
    public class func Global(_ priority: GCDQueuePriority = .default) -> GCDQueue {
        GCDQueue(dispatchQueue: DispatchQueue.global(qos: priority.dispatchQoSClass()))
    }
    
    /// 获取并发线程
    /// - Parameters:
    ///   - label: 线程标签
    ///   - priority: 优先级
    /// - Returns: 并发线程
    public class func Concurrent(_ label: String = "", _ priority: GCDQueuePriority = .default) -> GCDQueue {
        GCDQueue(dispatchQueue: DispatchQueue(label: label, qos: priority.dispatchQos(), attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil))
    }
    
    /// 获取串行队列
    /// - Parameters:
    ///   - label: 线程标签
    ///   - priority: 优先级
    /// - Returns: 串行队列
    public class func Serial(_ label: String = "", _ priority: GCDQueuePriority = .default) -> GCDQueue {
        GCDQueue(dispatchQueue: DispatchQueue(label: label, qos: priority.dispatchQos(), attributes: .init(rawValue:0), autoreleaseFrequency: .inherit, target: nil))
    }
    
    /// 异步执行
    /// - Parameter excute: 执行的闭包
    public func excute(_ excute: @escaping () -> Void) {
        dispatchQueue.async(execute: excute)
    }
    
    /// 延时 异步执行
    /// - Parameters:
    ///   - seconds: 延迟秒数
    ///   - excute: 执行的闭包
    public func excuteAfterDelay(_ seconds: Float, _ excute: @escaping () -> Void) {
        dispatchQueue.asyncAfter(deadline: .now() + .milliseconds(Int(seconds * 1000)), execute: excute)
    }
    
    /// 同步执行
    /// - Parameter excute: 执行的闭包
    public func sync(_ excute: @escaping () -> Void) {
        dispatchQueue.sync(execute: excute)
    }
    
    /// 主线程 执行
    /// - Parameter excute: 执行的闭包
    public class func excuteInMain(_ excute: @escaping () -> Void) {
        GCDQueue.Main.excute(excute)
    }
    
    /// 主线程 延迟执行
    /// - Parameters:
    ///   - seconds: 延迟秒数
    ///   - excute: 执行的闭包
    public class func ExcuteInMainAfterDelay(_ seconds: Float, _ excute: @escaping () -> Void) {
        GCDQueue.Main.excuteAfterDelay(seconds, excute)
    }
    
    /// 子线程执行
    /// - Parameters:
    ///   - priority: 优先级
    ///   - excute: 执行的闭包
    public class func ExcuteInGlobal(_ priority: GCDQueuePriority = .default, _ excute: @escaping () -> Void) {
        GCDQueue.Global(priority).excute(excute)
    }
    
    /// 子线程 延迟执行
    /// - Parameters:
    ///   - seconds: 延迟秒数
    ///   - excute: 执行的闭包
    public class func ExcuteInGlobalAfterDelay(_ seconds: Float, _ excute: @escaping () -> Void) {
        GCDQueue.Global().excuteAfterDelay(seconds, excute)
    }
}

