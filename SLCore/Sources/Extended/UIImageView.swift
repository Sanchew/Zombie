//
//  UIImageView.swift
//  CemaroseShop
//
//  Created by Sanchew on 2017/11/24.
//  Copyright © 2017年 cemarose. All rights reserved.
//

import UIKit
import Kingfisher

public extension UIImageView {
    
    public var size: CGSize {
        return frame.size
    }
    
    public func setImage(with URLString: String, placeholder: String? = nil) {
        var placeholderImage: UIImage? = nil
        if let placeholder = placeholder {
            placeholderImage = UIImage(named: placeholder)
        }
        setImage(with: URLString, placeholderImage: placeholderImage)
    }
    
    public func setImage(with URLString: String, placeholderImage: UIImage?) {
        if let url = URL(string: URLString) {
            setImage(with: url, placeholderImage: placeholderImage)
        }
    }
    public func setImage(with URL: URL, placeholderImage: UIImage? = nil) {
        self.kf.setImage(with: URL, placeholder: placeholderImage, options: nil, progressBlock: nil, completionHandler: nil)
    }
    
}
