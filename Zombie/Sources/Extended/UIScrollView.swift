//
//  File.swift
//  CemaroseShop
//
//  Created by Sanchew on 2017/11/30.
//  Copyright © 2017年 cemarose. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa
import MJRefresh

public extension Reactive where Base: UIScrollView {
    
    var nearBottom: Observable<()> {
        func isNearBottomEdge(scrollView: UIScrollView, edgeOffset: CGFloat = 20.0) -> Bool {
            return scrollView.contentOffset.y + scrollView.frame.size.height + edgeOffset > scrollView.contentSize.height
        }
        
        return self.contentOffset.asObservable()
            .flatMap { _ in
                return isNearBottomEdge(scrollView: self.base, edgeOffset: 20.0) ? Observable.just(()) : Observable.empty()
            }
    }
    
}

