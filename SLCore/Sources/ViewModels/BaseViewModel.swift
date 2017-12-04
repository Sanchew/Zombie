//
//  BaseViewModel.swift
//  CemaroseShop
//
//  Created by Sanchew on 2017/10/20.
//  Copyright © 2017年 cemarose. All rights reserved.
//

import UIKit

import RxSwift

public protocol EventTypeCompromise {
    // EventType
    associatedtype E
}

public extension EventTypeCompromise where Self: ViewModelType {
    public var event: Observable<E> {
        return self._event.availableMap{ $0 as? E }
    }
}

public protocol Datable {
    associatedtype DataType
}

private var _datasKey = "_datas"
public extension Datable where Self: BaseViewModel {

    // MARK: - Protected
    public var _datas: ReplaySubject<DataType> {
        if let datas = objc_getAssociatedObject(self, &_datasKey) as? ReplaySubject<DataType> {
            return datas
        }
        let datas = ReplaySubject<DataType>.create(bufferSize: 1)
        objc_setAssociatedObject(self, &_datasKey, datas, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        return datas
    }
    
    // MARK: - Outputs
    public var datas: Observable<DataType> {
        return self._datas.asObservable()
    }

}

open class ViewModelType: NSObject {
    
    // MARK: - Protected
    open var _event = PublishSubject<EventType>()
    
    // MARK: - Inputs
    open var eventReceiver: AnyObserver<EventType> {
        return _event.asObserver()
    }
    
}

open class BaseViewModel: ViewModelType {

    public override init() {
        super.init()
        setupBindings()
        loadData()
    }
    
    open func setupBindings() {
        
    }
    
    open func loadData() {
        
    }
    
}

