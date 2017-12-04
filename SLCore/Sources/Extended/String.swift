//
//  String.swift
//  CemaroseShop
//
//  Created by Sanchew on 2017/11/15.
//  Copyright © 2017年 cemarose. All rights reserved.
//

import Foundation
import UIKit

public extension String {
    
    public var intValue: Int {
        return Int(self) ?? 0
    }
    
    public var floatValue: CGFloat {
        return CGFloat(doubleValue)
    }
    
    public var doubleValue: Double {
        return Double(self) ?? 0
    }
    
    public func height(by width: CGFloat, font: UIFont? = nil, attributes: [NSAttributedStringKey: AnyObject]? = nil) -> CGFloat {
        return size(by: CGSize(width: width, height: 0), font: font, attributes: attributes).height
    }
    
    public func size(by size: CGSize, font: UIFont? = nil, attributes: [NSAttributedStringKey: AnyObject]? = nil) -> CGSize {
        let options: NSStringDrawingOptions = NSStringDrawingOptions(rawValue: NSStringDrawingOptions.usesFontLeading.rawValue | NSStringDrawingOptions.usesLineFragmentOrigin.rawValue)
        var _attributes = [NSAttributedStringKey: AnyObject]()
        if let font = font {
            _attributes[NSAttributedStringKey.font] = font
        }
        if let attributes = attributes {
            for (key, value) in attributes {
                _attributes[key] = value
            }
        }
        
        if let style = attributes?[NSAttributedStringKey.paragraphStyle] as? NSMutableParagraphStyle, style.lineBreakMode == .byWordWrapping {
            style.lineBreakMode = .byCharWrapping
        }else {
            let style = NSMutableParagraphStyle()
            style.lineBreakMode = .byCharWrapping
            _attributes[NSAttributedStringKey.paragraphStyle] = style
        }
        return NSString(string: self).boundingRect(with: size, options: options, attributes: attributes, context: nil).size
    }
    
}