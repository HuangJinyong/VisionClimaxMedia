//
//  UIColor+Extension.swift
//  shixi
//
//  Created by Jinyong on 16/8/6.
//  Copyright © 2016年 Jinyong. All rights reserved.
//

import UIKit

extension UIColor {
    /// 背景颜色
    class func shixiBGColor() -> UIColor {
        return UIColor(red: 19 / 255.0, green: 27 / 255.0, blue: 38 / 255.0, alpha: 1.0)
    }
    
    /// 辅助颜色
    class func shixiFZColor() -> UIColor {
        return UIColor(red: 19 / 255.0, green: 140 / 255.0, blue: 132 / 255.0, alpha: 1.0)
    }
}


extension UIButton {
    class func createButton(title: String, tag: Int, target: AnyObject?, action: Selector) -> UIButton {
        let btn = UIButton()
        btn.setTitle(title, for: .normal)
        btn.tag = tag
        btn.backgroundColor = UIColor.clear
        btn.layer.borderWidth = 2
        btn.layer.cornerRadius = 20
        btn.layer.borderColor = UIColor.white.cgColor
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        return btn
    }
}
