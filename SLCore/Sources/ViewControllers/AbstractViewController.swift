//
//  AbstractViewController.swift
//  Alamofire
//
//  Created by dev on 2017/12/14.
//

import UIKit

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
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let this = self as? AutoDismissKeyboardable {
            for input in this.inputViews where input.isFirstResponder {
                input.resignFirstResponder()
                return
            }
        }
        super.touchesEnded(touches, with: event)
    }

    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override open func didReceiveMemoryWarning() {
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
