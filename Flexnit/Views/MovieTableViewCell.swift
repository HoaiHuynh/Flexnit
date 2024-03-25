//
//  MovieTableViewCell.swift
//  Flexnit
//
//  Created by Huynh Van Hoai on 20/03/2024.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    static let identifier = "MovieTableViewCell"
    
    let playButton = NFIconButton(color: .white, systemImageName: "play.circle")
    
    private let moviePosterUIImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 7
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let movieLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(moviePosterUIImageView)
        contentView.addSubview(movieLabel)
        contentView.addSubview(playButton)
        
        applyConstraints()
    }
    
    private func applyConstraints() {
        let moviePosterUIImageViewConstraints = [
            moviePosterUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            moviePosterUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            moviePosterUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            moviePosterUIImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let movieLabelConstraints = [
            movieLabel.leadingAnchor.constraint(equalTo: moviePosterUIImageView.trailingAnchor, constant: 20),
            movieLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
            movieLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        let playMovieButtonConstraints = [
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            playButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(moviePosterUIImageViewConstraints)
        NSLayoutConstraint.activate(movieLabelConstraints)
        NSLayoutConstraint.activate(playMovieButtonConstraints)
    }
    
    public func configure(with model: MovieViewModel) {
        guard let url = URL(string: "\(Constants.baseImageURL)/\(model.posterURL)") else { return }
        moviePosterUIImageView.sd_setImage(with: url, completed: nil)
        
        movieLabel.text = model.titleName
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
