//
//  MenuViewController.swift
//  菜单控制器
//
//  Created by Jinyong on 16/9/5.
//  Copyright © 2016年 Jinyong. All rights reserved.
//

import UIKit

public class MenuView: UIView {
    
    public var menuItems: [MenuItem] = []
    
    
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
    
    // MARK: - private function
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
