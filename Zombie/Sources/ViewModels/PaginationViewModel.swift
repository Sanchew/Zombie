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

open class PaginationViewModel<V>: DataViewModel<V>, Refreshable {
    
    // MARK: - Protected
    public let _page = Variable<Int>(1)
    
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
    
    open override func setupBindings() {
        super.setupBindings()
        self.refresh.bind(to: self.flip).disposed(by: disposeBag)
    }
    
}

