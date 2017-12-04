//
//  UIButton.swift
//  CemaroseShop
//
//  Created by Sanchew on 2017/11/29.
//  Copyright © 2017年 cemarose. All rights reserved.
//

import UIKit

import Kingfisher

public extension UIButton {
    
    public func setImage(with URLString: String, for state: UIControlState = .normal) {
        if let url = URL(string: URLString) {
            setImage(with: url, for: state)
        }
    }
    public func setImage(with URL: URL, for state: UIControlState) {
        kf.setImage(with: URL, for: state)
    }
    
}
