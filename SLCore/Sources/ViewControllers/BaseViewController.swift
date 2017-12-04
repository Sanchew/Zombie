//
//  BaseViewController.swift
//  CemaroseShop
//
//  Created by Sanchew on 2017/8/29.
//  Copyright © 2017年 cemarose. All rights reserved.
//

import UIKit

import RxSwift

class BaseViewController<VM: BaseViewModel>: UIViewController {

    var viewModel: VM!
    
    
    var receiver: AnyObserver<EventType> {
        return viewModel.eventReceiver
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }

    func setupUI() {
        
    }
    
    func updateUI() {
        
    }
    
    func setupBindings() {
        
    }
    
    override func didReceiveMemoryWarning() {
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
