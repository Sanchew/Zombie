//
//  RepoCell.swift
//  Example
//
//  Created by Sanchew on 2017/12/4.
//  Copyright © 2017年 sanchew. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RepoCell: BaseTableViewCell<Repo> {
    
    override class func height(by repo: Repo? = nil) -> CGFloat {
        return 50
    }

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override var binder: AnyObserver<Repo> {
        return Binder(self) { this, repo in
            this.name.text = repo.name
        }.asObserver()
    }
    
    override func setupBindings() {
        super.setupBindings()
        button.rx.tap.flatMap { [unowned self] _ in
            return self.viewModel.datas
            }.map{ RepoEvent.repo($0) }
            .bind(to: rx.dispatcher).disposed(by: disposeBag)
    }
    
}
