//
//  MainViewController.swift
//  shixi
//
//  Created by Jinyong on 16/8/4.
//  Copyright © 2016年 Jinyong. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

let mediaCellID = "mediaCollectionView"

class MainViewController: UIViewController {
    var player: AVPlayer?
    
    // MARK: 系统调用方法
    override func viewDidLoad() {
        super.viewDidLoad()
        // 配置子控件
        setupUI()
        
        // 布局约束
        setupConstraints()
    }
    
    // MARK: 内部控制方法
    private func setupUI() {
        self.view.backgroundColor = UIColor.red()
        navigationController?.navigationBar.isHidden = true
        
        // 配置collectionView
        self.view.addSubview(mediaCollectionView)
    }
    
    private func setupConstraints() {
        mediaCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        // 布局collectionView约束
        var clvConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[mediaCollectionView]-0-|", options: .directionMask, metrics: nil, views: ["mediaCollectionView": mediaCollectionView])
        clvConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[mediaCollectionView]-44-|", options: .directionMask, metrics: nil, views: ["mediaCollectionView": mediaCollectionView])
        self.view.addConstraints(clvConstraints)
    }
    
    // MARK: 懒加载

    private lazy var mediaCollectionView: UICollectionView = {
        let clv = UICollectionView(frame: SCREEN_BOUNDS, collectionViewLayout: JYLineLayout())
        clv.register(MedioCollectionViewCell.self, forCellWithReuseIdentifier: mediaCellID)
        clv.dataSource = self
        clv.delegate = self
        return clv
    }()
}

// MARK: - Extension

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mediaCellID, for: indexPath) as! MedioCollectionViewCell
        let url = URL(fileURLWithPath: Bundle.main.pathForResource("Can't Feel My Face", ofType: "mp4")!)

        cell.backgroundColor = UIColor.yellow()
        cell.layer.borderWidth = 10
        cell.layer.borderColor = UIColor.white().cgColor
        cell.medioUrl = url
        
        return cell
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("11111")
        if let cell = collectionView.cellForItem(at: indexPath) as? MedioCollectionViewCell{
            cell.player?.play()
            print("1111")
        }
        
    }
}
