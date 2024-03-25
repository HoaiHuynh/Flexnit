//
//  APICaller.swift
//  Flexnit
//
//  Created by Huynh Van Hoai on 18/03/2024.
//

import Foundation

struct Constants {
    static let API_KEY = "5a2df8d709c17d16404c94981d40a30c"
    static let ACCESS_TOKEN = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1YTJkZjhkNzA5YzE3ZDE2NDA0Yzk0OTgxZDQwYTMwYyIsInN1YiI6IjY1Zjg1Mzg3YWUzODQzMDE3ZDRjODk5ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.oG7_evBuKyPN2J2XAYTPXiJk5PJTwJsnIYuMjfzZmnE"
    static let baseURL = "https://api.themoviedb.org"
    static let version = "3"
    static let domain = "\(baseURL)/\(version)"
    static let baseImageURL = "https://image.tmdb.org/t/p/w500"
}

enum APIErrors: Error {
    case failToGetData
}

class APICaller {
    static let shared = APICaller()

    let headers = [
        "accept": "application/json",
        "Authorization": "Bearer \(Constants.ACCESS_TOKEN)"
    ]

    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.domain)/trending/movie/day?language=en-US") else { return }

        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)

        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, _, error in
            guard let data = data, error == nil else { return }

            do {
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIErrors.failToGetData))
            }

        })

        task.resume()
    }

    func getTrendingTVs(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.domain)/trending/tv/day?language=en-US") else { return }

        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)

        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, _, error in
            guard let data = data, error == nil else { return }

            do {
                let result = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(APIErrors.failToGetData))
            }
        })

        task.resume()
    }

    func getUpcomingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.domain)/movie/upcoming?language=en-US&page=1") else { return }

        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)

        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, _, error in
            guard let data = data, error == nil else { return }

            do {
                let result = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(APIErrors.failToGetData))
            }
        })

        task.resume()
    }

    func getPopularMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.domain)/movie/popular?language=en-US&page=1") else {
            return
        }

        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)

        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, _, error in
            guard let data = data, error == nil else { return }

            do {
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIErrors.failToGetData))
            }

        })

        task.resume()
    }

    func getTopRatedMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.domain)/movie/top_rated?language=en-US&page=1") else {
            return
        }

        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)

        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, _, error in
            guard let data = data, error == nil else { return }

            do {
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIErrors.failToGetData))
            }

        })

        task.resume()
    }

    func getDiscoverMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.domain)/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc") else {
            return
        }

        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)

        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, _, error in
            guard let data = data, error == nil else { return }

            do {
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIErrors.failToGetData))
            }

        })

        task.resume()
    }

    func search(with query: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }

        guard let url = URL(string: "\(Constants.domain)/search/movie?query=\(query)&include_adult=false&language=en-US&page=1") else {
            return
        }

        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)

        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, _, error in
            guard let data = data, error == nil else { return }

            do {
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIErrors.failToGetData))
            }

        })

        task.resume()
    }
}
