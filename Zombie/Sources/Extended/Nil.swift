//
//  Nil.swift
//  Alamofire
//
//  Created by Sanchew on 2018/1/12.
//

import Foundation


public extension Optional {
    var isNil: Bool {
        switch self {
        case .none:
            return true
        default:
            return false
        }
    }
    var isNotNil: Bool {
        return !isNil
    }
    
}
