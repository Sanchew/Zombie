//
//  PaginationViewModel.swift
//  CemaroseShop
//
//  Created by Sanchew on 2017/12/2.
//  Copyright © 2017年 cemarose. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

open class PaginationViewModel<V>: DataViewModel<V> {
    
    // MARK: - Protected
    open let _page = Variable<Int>(1)
    open let _fliped = PublishSubject<RefreshState>()
    
    // MARK: - Inputs
    open var flip: AnyObserver<RefreshEvent> {
        return Binder<RefreshEvent>(self) { `self`, event in
            if event == .up {
                self._page.value += 1
            }else {
                self.disposeBag = DisposeBag()
                self.setupBindings()
            }
            }.asObserver()
    }
    
    // MARK: - Outputs
    open var fliped: Observable<RefreshState> {
        return _fliped.asObservable()
    }
    
}
