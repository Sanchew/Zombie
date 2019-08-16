//
//  UIView+Nib.swift
//  CemaroseShop
//
//  Created by Sanchew on 2017/10/26.
//  Copyright © 2017年 cemarose. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
// MARK: - ViewModel
public struct AnyDataViewModel<Base> {
    public let base: Base
    public let _viewModel: DataViewModel<Any>
    
    public var _datas: ReplaySubject<Any> {
        return _viewModel._datas
    }
}

private var viewModelKey = "viewModel"

public protocol AnyDataViewModelCompatible {
    associatedtype Base
    var viewModel: AnyDataViewModel<Base> { get }
}

public extension AnyDataViewModelCompatible {
    var viewModel: AnyDataViewModel<Self> {
        var viewModel = objc_getAssociatedObject(self, &viewModelKey) as? DataViewModel<Any>
        if viewModel == nil {
            viewModel = DataViewModel<Any>()
            objc_setAssociatedObject(self, &viewModelKey, viewModel, .OBJC_ASSOCIATION_RETAIN)
        }
        return AnyDataViewModel(base: self, _viewModel: viewModel!)
    }
}

extension UIView: AnyDataViewModelCompatible {
    public typealias Base = UIView
    
}

// MARK: - FillData
public protocol FillingData {
    func fill(by data: Any?)
}

public protocol DataTypeCompromise {
    // DataTpe
    associatedtype D
}

public extension AnyDataViewModel where Base: DataTypeCompromise {
    var datas: Observable<Base.D> {
        return self._viewModel.datas.availableMap{ $0 as? Base.D }
    }
}

public extension FillingData where Self: UIView{
    func fill(by data: Any?) {
        guard let data = data else { return }
        self.viewModel._datas.onNext(data)
    }
}

extension UIView: FillingData { }

// MARK: -
public extension UIView {
    
    func findFirstResponder() -> UIView? {
        let responder: UIView = self
        if responder.isFirstResponder {
            return responder
        }
        for view in self.subviews {
            if let first = view.findFirstResponder() {
                return first
            }
        }
        return nil
    }
    
    func addConstraints(with formats: [String], views: [String: Any]) {
        formats.forEach { (format) in
            addConstraints(with: format, views: views)
        }
    }
    
    func addConstraints(with format: String, views:[String: Any]) {
       addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: .directionLeadingToTrailing, metrics: nil, views: views))
    }
    
    func setupShadow(with radius: CGFloat = 3, color: UIColor = .black, offset: CGSize = .zero, opacity: Float = 0.6) {
//        layer.shadowRadius = radius
//        layer.shadowColor = color.cgColor
//        layer.shadowOffset = offset
//        layer.shadowOpacity = opacity
//        
//        let path = UIBezierPath()
//        let oft = CGFloat(-2)
//        path.move(to: CGPoint(x: bounds.minX - oft, y: bounds.minY - oft))
//        path.move(to: CGPoint(x: bounds.maxX + oft, y: bounds.minY - oft))
//        path.move(to: CGPoint(x: bounds.maxX + oft, y: bounds.maxY + oft))
//        path.move(to: CGPoint(x: bounds.maxX - oft, y: bounds.maxY + oft))
//        path.move(to: CGPoint(x: bounds.minX - oft, y: bounds.minY - oft))
//        
//        layer.shadowPath = path.cgPath
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        
//        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
//        self.layer.shouldRasterize = true
    }
    
}

// MARK: - Nib
public protocol UIViewInitWithNib {
    static var nibName: String { get }
}

public extension UIViewInitWithNib where Self: UIView {
 
    static var nibName: String {
        return String(describing: self)
    }
    
    static func loadFromNib(withOwner owner: Any? = nil, options: [AnyHashable: Any]? = nil) -> Self {
        return load(from: nibName, owner: owner, options: options)
    }
    
    static func load(from nibName: String, owner: Any? = nil, options: [AnyHashable: Any]? = nil) -> Self {
        let ins = UINib(nibName: nibName, bundle: nil).instantiate(withOwner: owner, options: options as? [UINib.OptionsKey : Any]).first
        guard let instance = ins as? Self else {
            fatalError("Couldn't instantiate view with nibName \(NSStringFromClass(self))")
        }
        return instance
    }
    
}

extension UIView: UIViewInitWithNib { }

// MARK: - Identifier
public protocol Identifiable {
    
}

public extension Identifiable {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}

extension UIView: Identifiable { }

