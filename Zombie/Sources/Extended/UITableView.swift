//
//  UITableView.swift
//  SLCore
//
//  Created by Sanchew on 2018/1/24.
//  Copyright © 2018年 sanchew. All rights reserved.
//

import UIKit

extension UITableView {
    
    public func register(with nibName: String) {
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
    
    public func register(with type: UICollectionViewCell.Type) {
        self.register(type, forCellReuseIdentifier: type.identifier)
    }
    
}
