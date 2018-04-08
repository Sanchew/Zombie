//
//  UICollectionView+Rx.swift
//  SLCore
//
//  Created by Sanchew on 2018/4/4.
//  Copyright © 2018年 sanchew. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base: UICollectionView {
    public func modelItemSelected<T>(_ modelType: T.Type) -> Observable<(IndexPath, T)> {
        return Observable.zip(self.itemSelected, self.modelSelected(modelType)) { ($0, $1) }
    }
}
