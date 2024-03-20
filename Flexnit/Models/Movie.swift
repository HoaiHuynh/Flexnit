//
//  Movie.swift
//  Flexnit
//
//  Created by Huynh Van Hoai on 18/03/2024.
//

import Foundation

struct MovieResponse: Codable {
    let page: Int
    let results: [Movie]
    let dates: Dates?

    let total_pages, total_results: Int
}

struct Dates: Codable {
    let maximum: String
    let minimum: String
}

struct Movie: Codable {
    let adult: Bool?
    let backdrop_path: String?
    let id: Int
    let title: String?
    let original_language: String?
    let original_title: String?
    let overview: String?
    let poster_path: String?
    let media_type: MediaType?
    let genre_ids: [Int]?
    let popularity: Double?
    let release_date: String?
    let video: Bool?
    let vote_average: Double?
    let vote_count: Int?
    
    let name: String?
    let original_name: String?
    let first_air_date: String?
    let origin_country: [String]?
}

enum MediaType: String, Codable {
    case movie
    case tv
}
