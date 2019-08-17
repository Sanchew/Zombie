//
//  PlainCoordinator.swift
//  Zombie
//
//  Created by Sanchew on 2019/8/17.
//  Copyright © 2019 sanchew. All rights reserved.
//

import UIKit
import RxSwift

open class PlainCoordinator<T, O: DeepLinkOptionType>: BaseCoordinator<T>, DeepLinkHandle {
    public typealias Option = O
    public let rootViewController: UIViewController
    public let readyState = ReplaySubject<Bool>.create(bufferSize: 1)
    
    open var navigationController: UINavigationController! {
        return rootViewController.navigationController
    }
    
    public init(_ rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    open func execute(with option: DeepLinkOptionType?) -> Self {
        readyState.flatMap{ [unowned self] ready -> Observable<T> in
            if let option = option, ready {
                _ = self.deeplinkHandle(option)
            }
            return Observable<T>.empty()
            }.subscribe().disposed(by: disposeBag)
        return self
    }
    
    open func deeplinkHandle(_ option: O) -> Bool {
        for handle in self.coordinators.map({ $0 as? DeepLinkHandle }).filter({ $0.isNotNil }).map({ $0! }) {
            if handle.deeplinkHandle(option) {
                return true
            }
        }
        return false
    }
    
    override open func coordinate<T>(to coordinator: BaseCoordinator<T>) -> Observable<T> {
        let obs = super.coordinate(to: coordinator)
        if let coordinator = coordinator as? PlainCoordinator {
            coordinator.readyState.onNext(true)
            coordinator.readyState.onCompleted()
        }
        return obs
    }
    
}
