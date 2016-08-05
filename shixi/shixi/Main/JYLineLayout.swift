//
//  JYLineLayout.swift
//  shixi
//
//  Created by Jinyong on 16/8/4.
//  Copyright © 2016年 Jinyong. All rights reserved.
//

import UIKit

class JYLineLayout: UICollectionViewFlowLayout {
    /**
     当collectionview的显示范围发生改变的时候，是否需要重新刷新布局
     一旦重新刷新布局，就会重新调用下面的方法：
     1.prepare
     2.layoutAttributesForElements:
    */
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    // 用来做布局的初始化操作
    override func prepare() {
        let itemH = self.collectionView!.bounds.size.height * 0.5
        let itemW = 4/3 * itemH
        
        self.itemSize = CGSize(width: itemW, height: itemH)
        self.scrollDirection = .horizontal
        self.collectionView?.showsVerticalScrollIndicator = false
        self.collectionView?.showsHorizontalScrollIndicator = false
        
        
    }
    
    /**
     这个方法返回值是一个数组（数据里面存放着rect范围内所有的元素的布局属性）
     这个方法的返回值决定了rect范围内所有的元素的排布（frame）
     
     */
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        // 1.获取已经计算好的布局属性
        guard let array = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        
        // 2.计算collectionView最中心的X值
        let centerX = self.collectionView!.contentOffset.x + self.collectionView!.bounds.size.width * 0.5
        
        // 3.取出当前rect范围内的所有元素，在原有布局属性基础上，进行微调
        for attr in array {
            let space = abs(attr.center.x - centerX)
            let scale = 1 - space / self.collectionView!.frame.size.width
            
            attr.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
        
        
        return array
    }
    
    
    // 这个方法的返回值，决定了collectionview停止滚动时的偏移量
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        // 1.计算出最终显示的矩形框
        let size = self.collectionView!.frame.size
        let rect = CGRect(x: proposedContentOffset.x, y: 0, width: size.width, height: size.height)
        
        // 2.获取super已经计算好的布局属性
        let array = super.layoutAttributesForElements(in: rect)
        
        // 3.计算collectionview最中心点的x值
        let conterX = proposedContentOffset.x + self.collectionView!.frame.size.width * 0.5
        
        // 存放最小的间距值
        var minSpace = CGFloat(MAXFLOAT)
        for attr in array! {
            if abs(minSpace) > abs(attr.center.x - conterX) {
                minSpace = attr.center.x - conterX
            }
        }
        
        // 修改原有的偏移量
        var offset = proposedContentOffset
        offset.x += minSpace
        
        return offset
    }
}
