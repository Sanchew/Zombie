//
//  AppCoordinator.swift
//  Example
//
//  Created by Sanchew on 2017/12/4.
//  Copyright © 2017年 sanchew. All rights reserved.
//

import UIKit
import RxSwift

class AppCoordinator: BaseCoordinator<Void> {

    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        let repoCoordinator = ViewCoordinator(window: window)
        coordinate(to: repoCoordinator).bind { (repo) in
            print("select repo name: \(repo.name)")
        }.disposed(by: disposeBag)
        return Observable.never()
    }
    
}
