//
//  UIColor.swift
//  Alamofire
//
//  Created by dev on 2017/12/8.
//

import UIKit

public extension UIColor {
    
    public convenience init(rgb: Int) {
        self.init(rgb: rgb, alpha: 1.0)
    }

    public convenience init(rgb: Int, alpha: CGFloat) {
        self.init(red: (rgb & 0xFF0000) >> 16, green: (rgb & 0xFF00) >> 8, blue: rgb & 0xFF, alpha: alpha)
    }

    public convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: alpha)
    }
    
}
