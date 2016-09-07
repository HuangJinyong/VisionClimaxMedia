//
//  MenuViewController.swift
//  菜单控制器
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
        centerButton.backgroundColor = UIColor.red()
        
        self.backgroundColor = UIColor.gray()
        self.addSubview(centerButton)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
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
        print("clickCenterBtn")
    }
    
    private func foldedAnimate() {
        isUnfolded = false
    }
    
    private func unfoldedAnimate() {
        isUnfolded = true
    }
    
    

}



public class MenuItem: UIView {
    
    private var itemButton: UIButton = UIButton()
    private var iconView = UIView()
    private var tappedAction: (() -> Void)?
    
    init(frame: CGRect, title: String, itemTapped: (() -> Void)?) {
        super.init(frame: frame)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: private function
    
    func createMenuItem() {
        self.addSubview(iconView)
        self.addSubview(itemButton)
        
        // constraints
        iconView.translatesAutoresizingMaskIntoConstraints = false
        itemButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraint(NSLayoutConstraint(item: iconView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 2.0))
        self.addConstraint(NSLayoutConstraint(item: iconView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 44.0)
        
        // configure
        
    }
    
}
