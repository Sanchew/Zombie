//
//  ViewCoordinator.swift
//  Example
//
//  Created by Sanchew on 2017/12/4.
//  Copyright © 2017年 sanchew. All rights reserved.
//

import UIKit
import RxSwift

class ViewCoordinator: BaseCoordinator<Repo> {

    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Repo> {
        let viewModel = RepoViewModel()
        let viewController = ViewController.make()
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.viewModel = viewModel
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        return viewModel.didSelectRepo
    }
    
}
