//
//  MovieDetailsViewController.swift
//  Movies
//
//  Created by Felipe Assis on 14/12/23.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: Setup view
    private func setupView() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
        view.addSubview(titleLabel)
        view.addSubview(movieImageView)
        view.addSubview(rateLabel)
        view.addSubview(synopsisLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            movieImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            movieImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieImageView.widthAnchor.constraint(equalToConstant: 250),
            
            rateLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 20),
            rateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            synopsisLabel.topAnchor.constraint(equalTo: rateLabel.bottomAnchor, constant: 24),
            synopsisLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            synopsisLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
        ])
    }
    
    //MARK: Components
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = movie.title
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private lazy var movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: movie.image)
        return imageView
    }()
    
    private lazy var rateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text =  "Nota dos usuários: \(movie.rate)"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private lazy var synopsisLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = movie.synopsis
        label.textColor = .white.withAlphaComponent(0.8)
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
}
