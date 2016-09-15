//
//  MenuViewController.swift
//  菜单按钮
//
//  Created by Jinyong on 16/9/5.
//  Copyright © 2016年 Jinyong. All rights reserved.
//

import UIKit

public class MenuView: UIView {
    
    private var menuItems: [MenuItem] = []
    private var centerButton: UIButton = UIButton()
    private var foldedFrame: CGRect = CGRect.zero
    private var unfoldedFrame: CGRect = SCREEN_BOUNDS
    private var isUnfolded: Bool = false // 默认false折叠，true展开
    
    init(frame: CGRect, image: UIImage?, selectedImage: UIImage?) {
        super.init(frame: frame)
        
        foldedFrame = frame
        centerButton.frame = CGRect(origin: CGPoint.zero, size: frame.size)
        centerButton.setImage(image, for: .normal)
        centerButton.setImage(selectedImage, for: .selected)
        centerButton.addTarget(self, action: #selector(self.clickCenterBtn), for: .touchUpInside)
        centerButton.layer.cornerRadius = frame.size.width * 0.5
        centerButton.backgroundColor = UIColor.red
        
        self.backgroundColor = UIColor.shixiBGColor()
        self.addSubview(centerButton)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        foldedOrUnfoldedAnimate()
    }
    
    // MARK: public function
    public func addMenuItems(items: [MenuItem]) {
        for item in items {
            item.frame.origin = foldedFrame.origin
            item.alpha = 0.0
        }
        
        menuItems += items
    }
    
    // MARK: private function
    
    @objc private func clickCenterBtn() {
        foldedOrUnfoldedAnimate()
    }
    
    // 折叠或展开动画
    private func foldedOrUnfoldedAnimate() {
        if isUnfolded { // 如果是展开的，就进行折叠
            isUnfolded = false
            
            UIView.animate(withDuration: 0.1, animations: {
                self.frame = self.foldedFrame
                self.alpha += 0.2
            }) { (_) in
                
            }
        } else { // 如果是折叠，就进行展开
            isUnfolded = true
            
            UIView.animate(withDuration: 0.1, animations: {
                self.frame = SCREEN_BOUNDS
                self.alpha -= 0.2
            }) { (_) in
                
            }
        }
    }
    

}



public class MenuItem: UIView {
    public var title: String? {
        get {
            return self.itemButton.titleLabel?.text
        }
        
        set {
            self.itemButton.setTitle(newValue, for: .normal)
        }
    }
    
    private var itemButton = UIButton()
    private var iconView = UIView()
    private var tappedAction: (() -> Void)?
    
    init(frame: CGRect, itemTapped: (() -> Void)?) {
        func createMenuItem(frame: CGRect) {
            self.addSubview(iconView)
            self.addSubview(itemButton)
            
            let iconHeight = frame.height / 3.0 + 2.0
            let itemWidth = frame.width
            
            // constraints
            //
            iconView.translatesAutoresizingMaskIntoConstraints = false
            itemButton.translatesAutoresizingMaskIntoConstraints = false
            // iconView constraint
            self.addConstraint(NSLayoutConstraint(item: iconView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 5.0))
            self.addConstraint(NSLayoutConstraint(item: iconView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: iconHeight))
            self.addConstraint(NSLayoutConstraint(item: iconView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0.0))
            self.addConstraint(NSLayoutConstraint(item: iconView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0))
            // itemButton constraint
            self.addConstraint(NSLayoutConstraint(item: itemButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: itemWidth))
            self.addConstraint(NSLayoutConstraint(item: itemButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: frame.height))
            self.addConstraint(NSLayoutConstraint(item: itemButton, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0))
            self.addConstraint(NSLayoutConstraint(item: itemButton, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0))
            
            // configure
            //
            self.iconView.backgroundColor = UIColor.shixiFZColor()
            self.itemButton.addTarget(self, action: #selector(self.tapped), for: .touchUpInside)
            self.itemButton.contentHorizontalAlignment = .left
            self.itemButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8.0, bottom: 0, right: 0)
        }
        
        super.init(frame: frame)
        createMenuItem(frame: frame)
        self.tappedAction = itemTapped
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: private function
    @objc private func tapped() {
        print("tapped--------")
        tappedAction?()
    }
}
