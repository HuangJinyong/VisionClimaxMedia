//
//  MainViewController.swift
//  当沙盒目录中有视频的时候，显示主界面
//
//  Created by Jinyong on 16/8/4.
//  Copyright © 2016年 Jinyong. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

let mediaCellID = "mediaCollectionView"

class MainViewController: UIViewController {
    
    private var player: AVPlayer?
    private var bool = false
    private var importVC = ImportViewController()
    
    private var menuButton = MenuView(frame: CGRect(x: 10, y: 10, width: 44, height: 44), image: nil, selectedImage: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        if !bool {
//            self.present(importVC, animated: true, completion: nil)
//        }
    }
    
    // MARK: private function
    private func setupUI() {
        self.view.backgroundColor = UIColor.red()
        navigationController?.navigationBar.isHidden = true
        
        self.view.addSubview(mediaCollectionView)
        self.view.addSubview(menuButton)
        
        let item = MenuItem(frame: CGRect(x: 50, y: 20, width: 100, height: 44), itemTapped: nil)
        item.title = "你好吗"
        self.view.addSubview(item)
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
        clv.backgroundColor = UIColor(red: 19 / 255.0, green: 27 / 255.0, blue: 38 / 255.0, alpha: 1.0)
        clv.dataSource = self
        clv.delegate = self
        return clv
    }()
}

// MARK: - Extension class

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mediaCellID, for: indexPath) as! MedioCollectionViewCell
        let url = URL(fileURLWithPath: Bundle.main.pathForResource("Can't Feel My Face", ofType: "mp4") ?? "")
        cell.layer.borderWidth = 10
        cell.layer.borderColor = UIColor.white().cgColor
        cell.medioUrl = url
        
        return cell
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? MedioCollectionViewCell{
            cell.player?.play()
            print("1111")
        }
    }
}
