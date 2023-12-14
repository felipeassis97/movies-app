//
//  MovieTableViewCell.swift
//  Movies
//
//  Created by Felipe Assis on 14/12/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    static let identifier = "MovieTableViewCell"
    
    //MARK: Components
    private lazy var movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        return label
    } ()
    
    private lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white.withAlphaComponent(0.7)
        return label
    } ()
    
    //MARK: Setup view
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func loadMovieData(movie: Movie) {
        movieImage.image = UIImage(named: movie.image)
        titleLabel.text = movie.title
        releaseDateLabel.text = "Lançamento: \(movie.releaseDate)"
    }
    
    private func setupView() {
        backgroundColor = UIColor(named: "BackgroundColor")
        addSubview(movieImage)
        addSubview(titleLabel)
        addSubview(releaseDateLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            movieImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            movieImage.widthAnchor.constraint(equalToConstant: 100),
            
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -16),
            titleLabel.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            releaseDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            releaseDateLabel.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 16),

        ])
    }

}



