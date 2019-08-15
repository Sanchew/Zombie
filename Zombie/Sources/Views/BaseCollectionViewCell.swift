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

open class BaseCollectionViewCell<E>: AbstractCollectionViewCell, DataTypeCompromise {

    public typealias D = E

    open override class func size(by data: Any? = nil) -> CGSize {
        return self.size(by: data as? D)
    }

    open class func size(by data: D?) -> CGSize {
        return .zero
    }

    open var binder: AnyObserver<D> {
        return Binder(self) { `self`, data in
            self.render(data: data)
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

    open func render(data: D) {

    }

}
