//
//  Single+Response.swift
//  CemaroseShop
//
//  Created by Sanchew on 2017/11/7.
//  Copyright © 2017年 cemarose. All rights reserved.
//

import Foundation
import RxSwift
import RxOptional
import Moya

extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    
//    public func availableMap<D: Decodable>(_ type: D.Type, atKeyPath keyPath: String? = nil, using decoder: JSONDecoder = JSONDecoder()) -> Single<D> {
//        return flatMap { response -> Single<D> in
//            return Single.just(try response.map(type, atKeyPath: keyPath, using: decoder))
//        }
//    }
    
}
