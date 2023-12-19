//
//  Movie.swift
//  Movies
//
//  Created by Felipe Assis on 14/12/23.
//

import Foundation


struct Movie: Decodable  {
    let id: Int
    let title: String
    let image: String
    let synopsis: String
    let rate: Double
    let releaseDate: String
}


/*let movies: [Movie] = [
    Movie(id: 1,
          title: "Inception",
          image: "Inception",
          synopsis: "A skilled thief enters the dreams of others to steal their deepest secrets.",
          rate: 8.8,
          releaseDate: "16/07/2010"),

    Movie(id: 2,
          title: "The Shawshank Redemption",
          image: "Redemption",
          synopsis: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
          rate: 9.3,
          releaseDate: "23/09/1994"),

    Movie(id: 3,
          title: "The Dark Knight",
          image: "Knight",
          synopsis: "When the menace known as The Joker emerges from his mysterious past, the Dark Knight must confront a foe who seeks to undermine everything he stands for.",
          rate: 9.0,
          releaseDate: "18/07/2008"),

    Movie(id: 4,
          title: "Pulp Fiction",
          image: "Pulp",
          synopsis: "The lives of two mob hitmen, a boxer, a gangster's wife, and a pair of diner bandits intertwine in four tales of violence and redemption.",
          rate: 8.9,
          releaseDate: "14/10/1994"),

    Movie(id: 5,
          title: "The Godfather",
          image: "Godfather",
          synopsis: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
          rate: 9.2,
          releaseDate: "24/03/1972")
]*/
