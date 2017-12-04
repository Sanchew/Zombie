//
//  UIResponder.swift
//  CemaroseShop
//
//  Created by Sanchew on 2017/11/27.
//  Copyright © 2017年 cemarose. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

public protocol EventDispatchable {
}

public protocol EventReceivable {
    var receiver: AnyObserver<EventType> { get }
}

public extension Reactive where Base: UIResponder {
    
    public var dispatcher: AnyObserver<EventType> {
        return Binder<EventType>(self.base) { base, event in
            if let next = base.next as? EventReceivable {
                next.receiver.onNext(event)
            }else{
                base.next?.rx.dispatcher.onNext(event)
            }
        }.asObserver()
    }
    
}


