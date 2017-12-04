//
//  UICollectionViewCell.swift
//  CemaroseShop
//
//  Created by Sanchew on 2017/11/15.
//  Copyright © 2017年 cemarose. All rights reserved.
//

import UIKit
import RxSwift
public protocol FigureCollectionOutSize {
    associatedtype T
    static func size(by data: T?) -> CGSize
}

public extension FigureCollectionOutSize {
    public static func size(by data: T? = nil) -> CGSize {
        return .zero
    }
}

extension UICollectionViewCell: FigureCollectionOutSize {
    public typealias T = Any
}

public protocol FigureTableViewOutHeight {
    associatedtype T
    static func height(by data: T?) -> CGFloat
}

public extension FigureTableViewOutHeight {
    public static func height(by data: T? = nil) -> CGFloat {
        return 0
    }
}

extension UITableViewCell: FigureTableViewOutHeight {
    public typealias T = Any
}
