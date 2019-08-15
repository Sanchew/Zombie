//
//  Event.swift
//  CemaroseShop
//
//  Created by Sanchew on 2017/11/27.
//  Copyright © 2017年 cemarose. All rights reserved.
//

import Foundation

public protocol Valuable {
    var value: Any { get }
}

public protocol EventType: Valuable { }
