//
//  BaseTableViewCell.swift
//  CemaroseShop
//
//  Created by Sanchew on 2017/12/3.
//  Copyright © 2017年 cemarose. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

open class BaseTableViewCell<E>: UITableViewCell, DataTypeCompromise {

    public typealias D = E
    open var binder: AnyObserver<D> {
        return Binder(self) { `self`, data in
            print("don't use data in \(String(describing: type(of: self)))")
            }.asObserver()
    }
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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

    open override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}