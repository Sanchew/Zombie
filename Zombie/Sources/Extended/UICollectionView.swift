//
//  UICollectionView.swift
//  CemaroseShop
//
//  Created by Sanchew on 2017/11/21.
//  Copyright © 2017年 cemarose. All rights reserved.
//

import UIKit

public extension UICollectionView {

    func register(with nibName: String) {
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
    
    func register(with type: UICollectionViewCell.Type) {
        self.register(type, forCellWithReuseIdentifier: type.identifier)
    }
    
}
