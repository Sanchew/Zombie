//
//  SLFlowCollectionView.swift
//  SLFlowCollectionView
//
//  Created by Sanchew on 2017/11/10.
//  Copyright © 2017年 sanchew. All rights reserved.
//

import UIKit

open class SLFlowCollectionView: UICollectionView, SLFlowCollectionViewLayoutDelegate {
    

    override public init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        configLayout()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configLayout()
    }
    
    func configLayout() {
        self.collectionViewLayout = SLFlowCollectionViewLayout(self)
    }
    
    public func cellSizeFromItem(at indexPath: IndexPath) -> CGSize {
        guard let delegate = self.delegate as? UICollectionViewDelegateFlowLayout else {
            return .zero
        }
        return delegate.collectionView?(self, layout: self.collectionViewLayout, sizeForItemAt: indexPath) ?? .zero
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
