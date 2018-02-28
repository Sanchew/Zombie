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


private var _refreshKey = "_refresh"

public extension Reactive where Base: UIScrollView {
    fileprivate var _refresh: PublishSubject<RefreshEvent> {
        get{
            if let refresh = objc_getAssociatedObject(self.base, &_refreshKey) as? PublishSubject<RefreshEvent> {
                return refresh
            }
            let refresh = PublishSubject<RefreshEvent>()
            objc_setAssociatedObject(self.base, &_refreshKey, refresh, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            return refresh
        }
        set {
        }
    }
    
    // MARK: - Inputs
    public var refreshed: AnyObserver<RefreshState> {
        return Binder<RefreshState>(self.base) { base, state in
            switch state {
            case .end:
                if let header = base.mj_header, header.isRefreshing {
                    base.mj_header.endRefreshing()
                    base.mj_footer.resetNoMoreData()
                }else if let footer = base.mj_footer {
                    footer.endRefreshing()
                }
            case .endWithNoMore:
                base.mj_footer.endRefreshingWithNoMoreData()
            }
            }.asObserver()
    }
    
    // MARK: - Outputs
    public var refresh: Observable<RefreshEvent> {
        return self._refresh.asObservable()
    }
    
    public var nearBottom: Observable<()> {
        func isNearBottomEdge(scrollView: UIScrollView, edgeOffset: CGFloat = 20.0) -> Bool {
            return scrollView.contentOffset.y + scrollView.frame.size.height + edgeOffset > scrollView.contentSize.height
        }
        
        return self.contentOffset.asObservable()
            .flatMap { _ in
                return isNearBottomEdge(scrollView: self.base, edgeOffset: 20.0) ? Observable.just(()) : Observable.empty()
            }
    }
    
}

public extension UIScrollView {

    public func setupRefresh(_ refresh: Refresh) {
        switch refresh {
        case .header:
            setupHeader()
        case .footer:
            setupFooter()
        default:
            setupHeader()
            setupFooter()
            self.mj_footer.isHidden = true
        }
    }
    
    private func setupHeader() {
        mj_header = MJRefreshNormalHeader(refreshingBlock: { [weak self] in
            self?.rx._refresh.onNext(.down)
        })
    }
    
    private func setupFooter() {
        mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: { [weak self] in
            self?.rx._refresh.onNext(.up)
        })
    }
    
}
