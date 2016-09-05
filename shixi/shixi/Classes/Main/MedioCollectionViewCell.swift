//
//  MedioCollectionViewCell.swift
//  shixi
//
//  Created by Jinyong on 16/8/5.
//  Copyright © 2016年 Jinyong. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class MedioCollectionViewCell: UICollectionViewCell {
    
    
    var player: AVPlayer?
    
    /// 视频源路径
    var medioUrl: URL? {
        didSet {
           meDioimageView.image = getMedioImage(url: medioUrl!)
        }
    }
    
    // 视频图片
    private lazy var meDioimageView: UIImageView = {
        let imgv = UIImageView()
        return imgv
    }()
    
    // 播放按钮视图
    private lazy var iconPlayer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.shixiBGColor()
        return view
    }()
    
    // 播放按钮图标
    private lazy var iconImageView: UIImageView = {
        let imgv = UIImageView()
        imgv.image = UIImage(named: "video-play")
        imgv.sizeToFit()
        
        return imgv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        setupConstraints()
    }
    
    // MARK: 内部控制方法
    // 提取视频的图片作为封面
    private func getMedioImage(url: URL) -> UIImage? {
        let generator = AVAssetImageGenerator(asset: AVAsset(url: url))
        let time = CMTimeMakeWithSeconds(0.0, 600)
        var actualTime:CMTime = CMTime()
        var image: UIImage?
        generator.appliesPreferredTrackTransform = true

        do {
            let cgImage: CGImage = try generator.copyCGImage(at: time, actualTime: &actualTime)
            image = UIImage(cgImage: cgImage)
        } catch {
            image = nil
        }
        return image
    }
    
    private func setupPlayer(url: URL) {
        player = AVPlayer(playerItem: AVPlayerItem(url: url))
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.contentView.bounds
        playerLayer.videoGravity = AVLayerVideoGravityResize
        
        self.contentView.layer.addSublayer(playerLayer)
    }
    
    private func setupUI() {
        self.contentView.addSubview(meDioimageView)
        self.contentView.addSubview(iconPlayer)
        iconPlayer.addSubview(iconImageView)

    }
    
    private func setupConstraints() {
        meDioimageView.translatesAutoresizingMaskIntoConstraints = false
        iconPlayer.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        var imgvConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[meDioimageView]-0-|", options: .directionMask, metrics: nil, views: ["meDioimageView": meDioimageView])
        imgvConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[meDioimageView]-0-|", options: .directionMask, metrics: nil, views: ["meDioimageView": meDioimageView])
        self.contentView.addConstraints(imgvConstraints)
        
        var iconPlayerConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[iconPlayer]-0-|", options: .directionMask, metrics: nil, views: ["iconPlayer": iconPlayer])
        iconPlayerConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[iconPlayer]-0-|", options: .directionMask, metrics: nil, views: ["iconPlayer": iconPlayer])
        self.contentView.addConstraints(iconPlayerConstraints)
        
        iconPlayer.addConstraint(NSLayoutConstraint(item: iconImageView, attribute: .centerX, relatedBy: .equal, toItem: iconPlayer, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        iconPlayer.addConstraint(NSLayoutConstraint(item: iconImageView, attribute: .centerY, relatedBy: .equal, toItem: iconPlayer, attribute: .centerY, multiplier: 1.0, constant: 0.0))

    }
   
}
