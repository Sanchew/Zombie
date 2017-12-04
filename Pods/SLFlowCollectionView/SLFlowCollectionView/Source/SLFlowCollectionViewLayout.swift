//
//  SLFlowCollectionViewLayout.swift
//  SLFlowCollectionView
//
//  Created by Sanchew on 2017/11/10.
//  Copyright © 2017年 sanchew. All rights reserved.
//

import UIKit

public protocol SLFlowCollectionViewLayoutDelegate {
    func cellSizeFromItem(at indexPath: IndexPath) -> CGSize;
}

private let ScreenWidth = UIScreen.main.bounds.width

open class SLFlowCollectionViewLayout: UICollectionViewFlowLayout {

    private var delegate: SLFlowCollectionViewLayoutDelegate!
    
    private var frames = [[(false, CGFloat(0), [CGRect]())]]
    private var attributes: [UICollectionViewLayoutAttributes]?
    
    init(_ delegate: SLFlowCollectionViewLayoutDelegate) {
        self.delegate = delegate
        super.init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self.collectionView?.delegate as? SLFlowCollectionViewLayoutDelegate
    }
    
    override open func prepare() {
        super.prepare()
        frames = [[(false, 0, [CGRect]())]]
        attributes = nil
    }

    override open func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        var frames = self.frames[indexPath.section]
        if frames.last?.0 ?? false {
            frames.append((false, 0, [CGRect]()))
        }
        let lineSpacing  = self.minimumLineSpacing
        var current = frames.last!
        var previous = frames.count > 1 ? frames[frames.count - 2] : nil
        
        var frame = CGRect(origin: .zero, size: delegate.cellSizeFromItem(at: indexPath))
        let itemSpec = frame.width == 0 ? 0 : (ScreenWidth - floor(ScreenWidth / frame.width) * frame.width) / (floor(ScreenWidth / frame.width) + 1)
        if ScreenWidth - itemSpec - current.1 < frame.width {
            previous = current
            current = (false, 0, [CGRect]())
            frames.append(current)
            var top = CGFloat(0)
            previous!.0 = true
            frames[frames.count - 2] = previous!
            for it in previous!.2 {
                if top < it.maxY {
                    top = it.maxY
                }
            }
            frame.origin.y = lineSpacing + top
        }else if previous == nil {
            
            frame.origin.x = itemSpec + current.1
            

        }else{
                frame.origin.x = itemSpec + current.1
                current.1 = frame.maxX
                if previous!.2.count == 1 || previous!.2.count < current.2.count + 1 {
                    frame.origin.y = previous!.2[0].maxY + lineSpacing
                }else{
                    if frame.width > previous!.2[current.2.count].width {
                        var top = CGFloat(0)
                        for it in previous!.2 {
                            if top < it.maxY {
                                top = it.maxY
                            }
                        }
                        frame.origin.y = top + lineSpacing
                    }else{
                        frame.origin.y = previous!.2[current.2.count].maxY + lineSpacing
                    }
                }

        }
        current.1 = frame.maxX
        current.2.append(frame)
        if ScreenWidth - frame.maxX < frame.width {
            current.0 = true
        }
        frames[frames.count - 1] = current
        self.frames[indexPath.section] = frames
        let attribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        attribute.frame = frame
        return attribute
    }

    override open func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let numberOfSections =  self.collectionView?.numberOfSections, numberOfSections > 0 else { return nil }
        guard let count = self.collectionView?.numberOfItems(inSection: 0) else { return nil }
        if attributes == nil {
            self.attributes = (0..<count).map{
                self.layoutAttributesForItem(at: IndexPath(item: $0, section: 0))!
            }
        }
        return attributes
    }

    override open var collectionViewContentSize: CGSize {
        var height = CGFloat(0);
        if let (_,_,frames) = frames.last?.last {
            for frame in frames {
                height = height < frame.maxY ? frame.maxY : height
            }
        }
        return CGSize(width: self.collectionView?.frame.width ?? ScreenWidth, height: height)
    }
    
}
