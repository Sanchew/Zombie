//
//  GlobalFunc.swift
//  CemaroseShop
//
//  Created by Sanchew on 2017/12/1.
//  Copyright © 2017年 cemarose. All rights reserved.
//

import Foundation

infix operator ??
public func ?? (left: Bool, right: @autoclosure @escaping () -> ()) {
    if !left { right() }
}

infix operator ?!
public func ?! (left: Bool, right: @autoclosure @escaping ()-> ()) {
    if left { right() }
}

