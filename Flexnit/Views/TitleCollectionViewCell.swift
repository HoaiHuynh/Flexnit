//
//  TitleCollectionViewCell.swift
//  Flexnit
//
//  Created by Huynh Van Hoai on 19/03/2024.
//

import SDWebImage
import UIKit

class TitleCollectionViewCell: UICollectionViewCell {
    static let identifier = "TitleCollectionViewCell"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(posterImageView)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    public func configure(with model: String) {
        
        guard let url = URL(string: "\(Constants.baseImageURL)/\(model)") else {return}

        posterImageView.sd_setImage(with: url, completed: nil)
    }
}
