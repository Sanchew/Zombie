//
//  AbstractViewController.swift
//  Alamofire
//
//  Created by dev on 2017/12/14.
//

import UIKit
import RxSwift

open class AbstractViewController: UIViewController, StoryboardInitialize {

    open class var identifier: String {
        return String(describing: self)
    }

    open class var storyboard: String {
        return "Main"
    }

    open class var bundle: Bundle? {
        return nil
    }
    
    open var _viewModel: BaseViewModel!
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let this = self as? AutoDismissKeyboardable {
            for input in this.inputViews where input.isFirstResponder {
                input.resignFirstResponder()
                return
            }
        }
        super.touchesEnded(touches, with: event)
    }

    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    open func setupUI() {
        
    }
    
    open func updateUI() {
        
    }
    
    open func setupBindings() {
        let showKeyboard = NotificationCenter.default.rx.notification(Notification.Name.UIKeyboardWillShow).flatMap { [weak self] (sender) -> Observable<CGFloat> in
            guard let `self` = self, let _ = self.view.window else { return .empty() }
            if let keyboardHeight = (sender.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect)?.height {
                return .just(keyboardHeight)
            }
            return .empty()
        }.share()
        showKeyboard.bind { [weak self] (keyboardHeight) in
            guard let `self` = self, let _ = self.view.window else { return }
            if let view = self.view.findFirstResponder() {
                let frame = view.convert(view.bounds, to: self.view)
                let navigationBarHeight = self.navigationController?.navigationBar.frame.maxY ?? 0
                let offset = (self.view.frame.height - keyboardHeight - frame.maxY + navigationBarHeight)
                
                if (offset >= navigationBarHeight) {
                    return
                }
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.frame = CGRect(x: 0, y: offset, width: self.view.frame.width, height: self.view.frame.height)
                })
            }
        }.disposed(by: disposeBag)
        NotificationCenter.default.rx.notification(Notification.Name.UIKeyboardWillHide).skipUntil(showKeyboard).bind { [weak self] (_) in
            guard let `self` = self, let _ = self.view.window  else { return }
            UIView.animate(withDuration: 0.3, animations: {
                self.view.frame = CGRect(x: 0, y: self.navigationController?.navigationBar.frame.maxY ?? 0, width: self.view.frame.width, height: self.view.frame.height)
            })
        }.disposed(by: disposeBag)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
