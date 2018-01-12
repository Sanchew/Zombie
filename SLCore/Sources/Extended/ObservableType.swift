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

public extension ObservableType where E: Equatable {
    
    public func filter(_ e: E) -> Observable<E> {
        return self.filter{ $0 == e}
    }
    
    public func filterAndMapVoid(_ e: E) -> Observable<Void> {
        return self.filter(e).map{ _ in () }
    }
    
    public func filter<R>(_ e: E, transform: @escaping (E) throws -> R) -> Observable<R> {
        return filter(e).map(transform)
    }
    
    public func filter<R>(_ e: E, transform: @escaping (E) throws -> R?) -> Observable<R> {
        return filter(e).availableMap(transform)
    }
    
}

