//
//  Array.swift
//  Alamofire
//
//  Created by Sanchew on 2018/1/12.
//

import Foundation


public extension Array {
    public func filterNil() -> [Element] {
        self.filter{ $0.isNotNil }.map{ $0! }
    }
}
