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

public enum Refresh {
    case header, footer, all
}

public enum RefreshEvent {
    case up, down
}

public enum RefreshState {
    case end, endWithNoMore
}

private var _refreshKey = "edgeDrop"

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
                if base.mj_header.isRefreshing {
                    base.mj_header.endRefreshing()
                    base.mj_footer.resetNoMoreData()
                }else {
                    base.mj_footer.endRefreshing()
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
