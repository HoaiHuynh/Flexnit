//
//  HeroHeaderUIView.swift
//  Flexnit
//
//  Created by Huynh Van Hoai on 13/03/2024.
//

import UIKit

class HeroHeaderUIView: UIView {
//    private let downloadButton: UIButton = {
//        let button = UIButton()
//        
//        button.setTitle("Download", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.setImage(UIImage(systemName: "plus"), for: .normal)
//        button.layer.borderColor = UIColor.white.cgColor
//        button.tintColor = UIColor.white
//        button.configuration?.imagePadding = 8
//        button.layer.borderWidth = 1
//        button.layer.cornerRadius = 8
//        button.translatesAutoresizingMaskIntoConstraints = false
//        
//        return button
//    }()
//    
//    private let playButton: UIButton = {
//        let button = UIButton()
//        
//        button.setTitle("Play", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
//        button.layer.borderColor = UIColor.white.cgColor
//        button.layer.backgroundColor = UIColor.white.cgColor
//        button.tintColor = UIColor.black
//        button.layer.cornerRadius = 8
//        button.translatesAutoresizingMaskIntoConstraints = false
//        
//        return button
//    }()
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "DunePoster")
        return imageView
    }()
    
    let playButton = NFButton(color: .white, title: "Play", systemImageName: "play.fill")
    let downloadButton = NFButton(color: .white, title: "Download", systemImageName: "plus")

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(heroImageView)
        addGradient()
        
        addSubview(playButton)
        addSubview(downloadButton)
        applyConstraints()
    }
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    private func applyConstraints() {
        let playButtonConstraints = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 140)
        ]
        
        let downloadButtonConstraints = [
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            downloadButton.widthAnchor.constraint(equalToConstant: 140)
        ]
        
        NSLayoutConstraint.activate(playButtonConstraints)
        NSLayoutConstraint.activate(downloadButtonConstraints)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        heroImageView.frame = bounds
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
}
