//
//  BaseViewController.swift
//  CemaroseShop
//
//  Created by Sanchew on 2017/8/29.
//  Copyright © 2017年 cemarose. All rights reserved.
//

import UIKit

import RxSwift

open class BaseViewController<VM: BaseViewModel>: AbstractViewController {

    open var viewModel: VM!
    
    open var receiver: AnyObserver<EventType> {
        return viewModel.eventReceiver
    }
    
    
    open override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
