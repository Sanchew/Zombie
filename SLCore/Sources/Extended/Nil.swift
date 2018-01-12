//
//  Nil.swift
//  Alamofire
//
//  Created by Sanchew on 2018/1/12.
//

import Foundation


public extension Optional {
    public var isNil: Bool {
        switch self {
        case .none:
            return true
        default:
            return false
        }
    }
    public var isNotNil: Bool {
        return !isNil
    }
    
}
