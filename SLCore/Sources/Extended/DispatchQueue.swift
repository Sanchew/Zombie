//
//  DispatchQueue.swift
//  Alamofire
//
//  Created by dev on 2017/12/14.
//

import Foundation

extension DispatchQueue {

    private static var _onceTracker = [String]()

    public class func once(token: String, block: ()->()) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        if _onceTracker.contains(token) { return }
        _onceTracker.append(token)
        block()
    }

}
