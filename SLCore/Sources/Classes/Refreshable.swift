//
//  Refreshable.swift
//  Alamofire
//
//  Created by Sanchew on 2018/2/9.
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

public protocol Refreshable {
    
}


private var _refreshKey = "_refresh"
private var _refreshStateKey = "_refreshStatus"
extension Refreshable {
    
    fileprivate var _refresh: PublishSubject<RefreshEvent> {
        get{
            if let refresh = objc_getAssociatedObject(self, &_refreshKey) as? PublishSubject<RefreshEvent> {
                return refresh
            }
            let refresh = PublishSubject<RefreshEvent>()
            objc_setAssociatedObject(self, &_refreshKey, refresh, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            return refresh
        }
        set {
        }
    }
    
    fileprivate var _refreshStatus: PublishSubject<RefreshState> {
        get{
            if let status = objc_getAssociatedObject(self, &_refreshStateKey) as? PublishSubject<RefreshState> {
                return status
            }
            let status = PublishSubject<RefreshState>()
            objc_setAssociatedObject(self, &_refreshStateKey, status, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            return status
        }
        set {
        }
    }
    
    
    // MARK: - Inputs
    public var refreshed: AnyObserver<RefreshState> {
        return _refreshStatus.asObserver()
    }
    
    // MARK: - Outputs
    public var refresh: Observable<RefreshEvent> {
        return self._refresh.asObservable()
    }
    
    func refreshBind(to scrollView: UIScrollView, refresh: Refresh = .all) -> Disposable {
        var initHeader: Bool = false, initFooter: Bool = false
        switch refresh {
        case .all:
            initHeader = true
            initFooter = true
        case .header:
            initFooter = true
        case .footer:
            initFooter = true
        }
        let refresh = self._refresh
        if initFooter {
            scrollView.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: {
                refresh.onNext(.up)
            })
        }
        if initHeader {
            scrollView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
                refresh.onNext(.down)
            })
            scrollView.mj_footer?.isHidden = true
        }
        return self._refreshStatus.subscribe(onNext: { (state) in
            switch state {
            case .end:
                if let header = scrollView.mj_header, header.isRefreshing {
                    scrollView.mj_header.endRefreshing()
                    scrollView.mj_footer.isHidden = false
                    scrollView.mj_footer.resetNoMoreData()
                }else if let footer = scrollView.mj_footer {
                    footer.endRefreshing()
                }
            case .endWithNoMore:
                scrollView.mj_footer.endRefreshingWithNoMoreData()
            }
        }, onDisposed: {
            scrollView.mj_header = nil
            scrollView.mj_footer = nil
        })
    }
    
}
