//
//  AbstractTableViewCell.swift
//  Alamofire
//
//  Created by dev on 2017/12/13.
//

import UIKit

open class AbstractTableViewCell: UITableViewCell {

    open class func height(by data: Any? = nil) -> CGFloat {
        return 0
    }

    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
