//
//  ImportViewController.swift
//  视频导入界面
//
//  Created by Jinyong on 16/8/6.
//  Copyright © 2016年 Jinyong. All rights reserved.
//

import UIKit

class ImportViewController: UIViewController {
    
    
    /// 明星专场视频导入按钮
    private lazy var starBtn: UIButton = UIButton.createButton(title: "明星专场视频导入", tag: 10000, target: self, action: #selector(self.clickBtn))
    /// 活动直播视频导入按钮
    private lazy var activityBtn: UIButton = UIButton.createButton(title: "活动直播视频导入", tag: 10001, target: self, action: #selector(self.clickBtn))
    /// 宣传片视频导入按钮
    private lazy var trailerBtn: UIButton = UIButton.createButton(title: "宣传片视频导入", tag: 10002, target: self, action: #selector(self.clickBtn))
    
    // logo图标
    private var logoImigeView = UIImageView(image: UIImage(named: "logo"))


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: 内部控制方法
    
    @objc private func clickBtn(sender: UIButton) {
        switch sender.tag {
        case 10000:
            print("11111")
        
        case 10001:
            print("22222")
        
        case 10002:
            print("33333")
        
        default:
            return
        }
    }
    
    private func setupUI() {
        self.view.backgroundColor = UIColor.shixiBGColor()
        
        self.view.addSubview(logoImigeView)
        self.view.addSubview(starBtn)
        self.view.addSubview(activityBtn)
        self.view.addSubview(trailerBtn)
    }
    
    private func setupConstraints() {
        logoImigeView.translatesAutoresizingMaskIntoConstraints = false
        starBtn.translatesAutoresizingMaskIntoConstraints = false
        activityBtn.translatesAutoresizingMaskIntoConstraints = false
        trailerBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addConstraint(NSLayoutConstraint(item: logoImigeView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 10.0))
        self.view.addConstraint(NSLayoutConstraint(item: logoImigeView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 10))
        
        // --- 视频导入按钮的排列方式以活动直播视频导入按钮为中心，上下排列 ---

        self.view.addConstraint(NSLayoutConstraint(item: activityBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0.0, constant: 40))
        self.view.addConstraint(NSLayoutConstraint(item: activityBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0.0, constant: 180))
        self.view.addConstraint(NSLayoutConstraint(item: activityBtn, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: activityBtn, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        
        self.view.addConstraint(NSLayoutConstraint(item: starBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0.0, constant: 40))
        self.view.addConstraint(NSLayoutConstraint(item: starBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0.0, constant: 180))
        self.view.addConstraint(NSLayoutConstraint(item: starBtn, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: starBtn, attribute: .bottom, relatedBy: .equal, toItem: activityBtn, attribute: .top, multiplier: 1.0, constant: -10.0))
        
        self.view.addConstraint(NSLayoutConstraint(item: trailerBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0.0, constant: 40))
        self.view.addConstraint(NSLayoutConstraint(item: trailerBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0.0, constant: 180))
        self.view.addConstraint(NSLayoutConstraint(item: trailerBtn, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: trailerBtn, attribute: .top, relatedBy: .equal, toItem: activityBtn, attribute: .bottom, multiplier: 1.0, constant: 10.0))
    }

}
