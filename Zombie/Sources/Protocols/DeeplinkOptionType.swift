//
//  DeeplinkOptionType.swift
//  Zombie
//
//  Created by Sanchew on 2019/8/17.
//  Copyright © 2019 sanchew. All rights reserved.
//

import Foundation
import Regex

public protocol DeepLinkHandle {
    func deeplinkHandle(_ option: DeepLinkOptionType) -> Bool
}

public protocol DeepLinkOptionType {
    
    static func build(with url: String) -> DeepLinkOptionType?
    
}

public extension DeepLinkOptionType {
    
    static func build(with url: URL) -> DeepLinkOptionType? {
        return build(with: url.absoluteString)
    }
    
    static func build(with options: [AnyHashable: Any]) -> DeepLinkOptionType? {
        if let deeplink = options["deeplink"] as? String {
            return self.build(with: deeplink)
        }
        return nil
    }
    
}
