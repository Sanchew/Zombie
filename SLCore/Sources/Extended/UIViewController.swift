//
//  UIStoryboard.swift
//  CemaroseShop
//
//  Created by Sanchew on 2017/9/5.
//  Copyright © 2017年 cemarose. All rights reserved.
//

import UIKit

public protocol StoryboardInitialize {
    static var identifier: String { get }
    static var storyboard: String { get }
    static var bundle: Bundle? { get }
}

public extension StoryboardInitialize where Self: UIViewController {
    
    public static var identifier: String {
        return String(describing: self)
    }
    
    public static var storyboard: String {
        return "Main"
    }
    
    public static var bundle: Bundle? {
        return nil
    }
    
    public static func make()-> Self {
        let storyboard = UIStoryboard(name: self.storyboard, bundle: self.bundle)
        let instantiateOptinal = storyboard.instantiateViewController(withIdentifier: self.identifier)
        guard let instance = instantiateOptinal as? Self else {
            fatalError("Couldn't instantiate view controller with identifier \(self.identifier) in storyboard \(self.storyboard)")
        }
        return instance
    }
    
}

extension UIViewController: StoryboardInitialize { }
