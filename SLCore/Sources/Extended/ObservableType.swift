//
//  ObservableType.swift
//  CemaroseShop
//
//  Created by Sanchew on 2017/12/1.
//  Copyright © 2017年 cemarose. All rights reserved.
//

import Foundation

import RxSwift
import RxOptional

public extension ObservableType {
    public func availableMap<R>(_ transform: @escaping (Self.E) throws -> R?) -> RxSwift.Observable<R> {
        return self.map(transform).filterNil()
    }
    
    public func validMap<R: Occupiable>(_ transform: @escaping (Self.E) throws -> R) -> RxSwift.Observable<R> {
        return self.map(transform).filterEmpty()
    }
}

public extension ObservableType where E: Occupiable {
    public func validMap<R>(_ transform: @escaping (Self.E) throws -> R) -> RxSwift.Observable<R> {
        return self.filterEmpty().map(transform)
    }
}


