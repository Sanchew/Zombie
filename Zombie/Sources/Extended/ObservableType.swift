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
    func availableMap<R>(_ transform: @escaping (Self.Element) throws -> R?) -> RxSwift.Observable<R> {
        return self.map(transform).filterNil()
    }
    
    func validMap<R: Occupiable>(_ transform: @escaping (Self.Element) throws -> R) -> RxSwift.Observable<R> {
        return self.map(transform).filterEmpty()
    }
    
}

public extension ObservableType where Element: Occupiable {
    func validMap<R>(_ transform: @escaping (Self.Element) throws -> R) -> RxSwift.Observable<R> {
        return self.filterEmpty().map(transform)
    }
}

public extension ObservableType where Element: Equatable {
    
    func filter(_ e: Element) -> Observable<Element> {
        return self.filter{ $0 == e }
    }
    
    func filterAndMapVoid(_ e: Element) -> Observable<Void> {
        return self.filter(e).map{ _ in () }
    }
    
    func filter<R>(_ e: Element, transform: @escaping (Element) throws -> R) -> Observable<R> {
        return filter(e).map(transform)
    }
    
    func filter<R>(_ e: Element, transform: @escaping (Element) throws -> R?) -> Observable<R> {
        return filter(e).availableMap(transform)
    }
    
}

