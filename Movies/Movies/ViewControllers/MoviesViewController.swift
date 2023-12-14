//
//  MoviesViewController.swift
//  Movies
//
//  Created by Felipe Assis on 14/12/23.
//

import Foundation
import UIKit

class MoviesViewController: UIViewController {
    private var filteredMovies: [Movie] = []
    private var isFilterActive: Bool = false
    
//MARK: Components
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
        table.dataSource = self
        table.delegate = self
        table.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        return table
    }()
    
    private lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.placeholder = "Buscar filme"
        search.searchTextField.backgroundColor = .white
        search.delegate = self
        return search
    }()
    
//MARK: Setup View
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ])
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
        view.addSubview(tableView)
        setupConstraints()
    }
    
//MARK: Navigation Bar
    private func setupNavigationBar() {
        title = "Filmes Populares"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.titleView = searchBar
    }
}

//MARK: Extensions
extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  isFilterActive ? filteredMovies.count : movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else { return UITableViewCell()
        }
        
        //cell.textLabel?.text = self.names[indexPath.row]
        //var configuration = cell.defaultContentConfiguration()
        //configuration.text = movies[indexPath.row].title
        //configuration.textProperties.color = .white
        cell.selectionStyle = .none
        let movie = isFilterActive ? filteredMovies[indexPath.row] : movies[indexPath.row]

        cell.loadMovieData(movie: movie)
        return cell
    }

    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let movie = isFilterActive ? filteredMovies[indexPath.row] : movies[indexPath.row]
        let detailsVC = MovieDetailsViewController(movie: movie)
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
}

extension MoviesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isFilterActive = false
        } else {
            isFilterActive = true
            filteredMovies = movies.filter({ movie in
                movie.title.lowercased().contains(searchText.lowercased())
            })
        }
        tableView.reloadData()
    }
}
