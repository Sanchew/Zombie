//
//  UITableView+RX.swift
//  Alamofire
//
//  Created by Sanchew on 2018/4/4.
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base: UITableView {
    public func modelItemSelected<T>(_ modelType: T.Type) -> Observable<(IndexPath, T)> {
        return Observable.zip(self.itemSelected, self.modelSelected(modelType)) { ($0, $1) }
    }
}
