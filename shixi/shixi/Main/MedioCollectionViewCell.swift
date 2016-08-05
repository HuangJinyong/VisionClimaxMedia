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
    
    var medioUrl: URL? {
        didSet {
           imageView.image = getMedioImage(url: medioUrl!)
        }
    }
    
    private lazy var imageView: UIImageView = {
        let imgv = UIImageView()
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
        self.contentView.addSubview(imageView)
    }
    
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        var imgvConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[imageView]-0-|", options: .directionMask, metrics: nil, views: ["imageView": imageView])
        imgvConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[imageView]-0-|", options: .directionMask, metrics: nil, views: ["imageView": imageView])
        self.contentView.addConstraints(imgvConstraints)
    }
   
}
