//
//  Reactive.swift
//  CemaroseShop
//
//  Created by Sanchew on 2017/11/15.
//  Copyright © 2017年 cemarose. All rights reserved.
//

import UIKit
import RxSwift

public extension NSObject {
    static var disposeBagKey = "disposeBag"
    var disposeBag: DisposeBag {
        get{
            if let disposeBag = objc_getAssociatedObject(self, &NSObject.disposeBagKey) as? DisposeBag {
                return disposeBag
            }
            let disposeBag = DisposeBag()
            self.disposeBag = disposeBag
            return disposeBag
        }
        set{
            objc_setAssociatedObject(self, &NSObject.disposeBagKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
}

