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

open class BaseTableViewCell<E>: AbstractTableViewCell, DataTypeCompromise {

    public typealias D = E

    open override class func height(by data: Any? = nil) -> CGFloat {
        return self.height(by: data as? D)
    }

    open class func height(by data: D?) -> CGFloat {
        return 0
    }

    open var binder: AnyObserver<D> {
        return Binder(self) { `self`, data in
//            print("don't use data in \(String(describing: type(of: self)))")
            self.render(data: data)
            }.asObserver()
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
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

    open func render(data: D) {

    }

    open override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
