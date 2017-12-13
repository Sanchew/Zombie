//
//  BaseCollectionViewCell.swift
//  CemaroseShop
//
//  Created by Sanchew on 2017/11/15.
//  Copyright © 2017年 cemarose. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

open class BaseCollectionViewCell<E>: UICollectionViewCell, DataTypeCompromise {

    public typealias D = E
    
    open var binder: AnyObserver<D> {
        return Binder(self) { `self`, data in
            self.setup(data: data)
        }.asObserver()
    }

    public init() {
        super.init(frame: .zero)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupBindings()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        setupBindings()
    }

    open override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
        updateUI()
        setupBindings()
    }
    
    open func setupUI() {
        
    }
    
    open func updateUI() {
        
    }
    
    open func setupBindings() {
        self.viewModel.datas.bind(to: self.binder).disposed(by: disposeBag)
    }

    open func setup(data: D) {

    }

}
