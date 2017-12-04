//
//  UICollectionViewCell.swift
//  CemaroseShop
//
//  Created by Sanchew on 2017/11/15.
//  Copyright © 2017年 cemarose. All rights reserved.
//

import UIKit
import RxSwift
public protocol FigureOutSize {
    associatedtype T
    static func size(by data: T?) -> CGSize
}

public extension FigureOutSize {
    public static func size(by data: T? = nil) -> CGSize {
        return .zero
    }
}

extension UICollectionViewCell: FigureOutSize {
    public typealias T = Any
}

extension UITableViewCell: FigureOutSize {
    public typealias T = Any
}
