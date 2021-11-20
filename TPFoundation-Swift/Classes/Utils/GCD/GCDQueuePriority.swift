//
//  GCDQueuePriority.swift
//  TPFoundation-Swift
//
//  Created by Topredator on 2021/11/20.
//

import Foundation
import QuartzCore

public enum GCDQueuePriority {
    case background, low, `default`, High, userInteractive, unspecified
    func dispatchQoSClass() -> DispatchQoS.QoSClass {
        var qos: DispatchQoS.QoSClass
        switch self {
        case .background:
            qos = .background
            break
        case .low:
            qos = .utility
            break
        case .default:
            qos = .default
            break
        case .High:
            qos = .userInitiated
            break
        case .userInteractive:
            qos = .userInteractive
            break
        case .unspecified:
            qos = .unspecified
            break
        }
        return qos
    }
    
    func dispatchQos() -> DispatchQoS {
        var qos: DispatchQoS
        switch self {
        case .background:
            qos = .background
            break
        case .low:
            qos = .utility
            break
        case .default:
            qos = .default
            break
        case .High:
            qos = .userInitiated
            break
        case .userInteractive:
            qos = .userInteractive
            break
        case .unspecified:
            qos = .unspecified
            break
        }
        return qos
    }
}
