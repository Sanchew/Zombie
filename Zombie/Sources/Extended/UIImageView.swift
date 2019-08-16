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
    
    var size: CGSize {
        return frame.size
    }
    
    func setImage(with URLString: String, placeholder: String? = nil) {
        var placeholderImage: UIImage? = nil
        if let placeholder = placeholder {
            placeholderImage = UIImage(named: placeholder)
        }
        setImage(with: URLString, placeholderImage: placeholderImage)
    }
    
    func setImage(with URLString: String, placeholderImage: UIImage?) {
        if let url = URL(string: URLString) {
            setImage(with: url, placeholderImage: placeholderImage)
        }
    }
    func setImage(with URL: URL, placeholderImage: UIImage? = nil) {
        self.kf.setImage(with: Source.network(URL), placeholder: placeholderImage, options: nil, progressBlock: nil, completionHandler: nil)
    }
    
}
