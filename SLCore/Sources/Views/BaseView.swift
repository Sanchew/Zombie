//
//  BaseView.swift
//  CemaroseShop
//
//  Created by Sanchew on 2017/12/3.
//  Copyright © 2017年 cemarose. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

open class BaseView<E>: UIView, DataTypeCompromise {

    public typealias D = E

    open var binder: AnyObserver<D> {
        return Binder(self) { `self`, data in
            print("don't use data in \(String(describing: type(of: self)))")
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
    
    open func setupUI() {
        
    }
    
    open func updateUI() {
        
    }
    
    open func setupBindings() {
        self.viewModel.datas.bind(to: self.binder).disposed(by: disposeBag)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
