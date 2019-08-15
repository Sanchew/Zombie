//
//  RepoViewModel.swift
//  Example
//
//  Created by Sanchew on 2017/12/4.
//  Copyright © 2017年 sanchew. All rights reserved.
//

import UIKit
import RxSwift

enum RepoEvent: EventType {
    case repo(Repo)
    
    var value: Any {
        switch self {
        case let .repo(v):
            return v
        }
    }
}

class RepoViewModel: DataViewModel<[Repo]>, EventTypeCompromise {

    typealias E = RepoEvent
    
    // MARK: - Output
    var didSelectRepo: Observable<Repo>!
    
    override init() {
        super.init()
        self.didSelectRepo = event.availableMap{ $0.value as? Repo }
    }
    
    override func setupBindings() {
        super.setupBindings()
        Api.githubProvider.rx.request(.repos).map([Repo].self, atKeyPath: "items", using: JSONDecoder())
            .asObservable().bind(to: self._datas).disposed(by: disposeBag)
    }
    
}
