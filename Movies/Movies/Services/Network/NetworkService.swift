//
//  NetworkService.swift
//  Movies
//
//  Created by Felipe Assis on 17/12/23.
//

import Foundation

enum MovieError: Error {
    case decodeError
    case invalidUrl
    case invalidResponse
}

class NetworkService {
    func getMovies(completion: @escaping (Result<[Movie], MovieError>) -> Void) {
        let urlString = "http://localhost:3000/movies"
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let httpReponse = response as? HTTPURLResponse, httpReponse.statusCode == 200 
            else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                completion(.success(movies))
                
            } catch (_) {
                completion(.failure(.decodeError))
            }
            
        }
        task.resume()
        
        
    }
}
