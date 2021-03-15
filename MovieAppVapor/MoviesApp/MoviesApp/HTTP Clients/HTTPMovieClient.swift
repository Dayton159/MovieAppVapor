//
//  HTTPMovieClient.swift
//  MoviesApp
//
//  Created by Dayton on 09/02/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

class HTTPMovieClient:ObservableObject {
    
    @Published var movies: [Movie] = [Movie]()
    @Published var reviews: [Review]? = [Review]()
    

    
    func getReviewsByMovie(movie:Movie) {
        
        guard let uuid = movie.id,
              let url = URL(string: "http://127.0.0.1:8080/movies/\(uuid.uuidString)/reviews") else {
            fatalError("URL is not defined")
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            let reviews = try? JSONDecoder().decode([Review].self, from: data)
            
            if let reviews = reviews {
                DispatchQueue.main.async {
                    self.reviews = reviews
                }
            }
            
        }.resume()
    }
    
    func getAllMovies() {
        
        guard let url = URL(string: "http://127.0.0.1:8080/movies") else { fatalError("URL is not defined") }
        
        URLSession.shared.dataTask(with: url) { data, response, error in

            guard let data = data, error == nil else {
                return
            }
            
            let movies = try? JSONDecoder().decode([Movie].self, from: data)
            
            if let movies = movies {
                // Published property wrapper must be called on main thread
                DispatchQueue.main.async {
                    self.movies = movies
                }
            }
        }.resume()
    }
    
    func saveMovie(name:String, poster:String, completion: @escaping (Bool) -> Void) {
        
        guard let url = URL(string: "http://127.0.0.1:8080/movies") else { fatalError("URL is not defined") }
        
        let movie = Movie(title: name, poster: poster)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // attach the body
        request.httpBody = try? JSONEncoder().encode(movie)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let _ = data, error == nil else {
                return completion(false)
            }
            
            completion(true)
            
        }.resume()
        
    }
    
    func saveReview(review:Review, completion: @escaping (Bool) -> Void) {
        
        guard let url = URL(string: "http://127.0.0.1:8080/reviews") else { fatalError("URL is not defined") }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(review)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let _ = data, error == nil else {
                return completion(false)
            }
            
            completion(true)
            
        }.resume()
        
    }
    
    func deleteMovie(movie: Movie, completion: @escaping (Bool) -> Void) {
       
        guard let uuid = movie.id,
              let url = URL(string: "http://127.0.0.1:8080/movies/\(uuid.uuidString)") else {
            fatalError("URL is not defined")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let _ = data, error == nil else {
                return completion(false)
            }
            completion(true)
            
        }.resume()
    }
}
