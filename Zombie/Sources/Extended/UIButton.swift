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
    
    func setImage(with URLString: String, for state: UIControl.State = .normal) {
        if let url = URL(string: URLString) {
            setImage(with: url, for: state)
        }
    }
    func setImage(with URL: URL, for state: UIControl.State) {
        kf.setImage(with: URL, for: state)
    }
    
}
