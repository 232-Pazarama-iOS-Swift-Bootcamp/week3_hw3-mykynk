//
//  Movie.swift
//  iTunes Client App
//
//  Created by Muhammed Yusuf Kaynak on 10.10.2022.
//

import Foundation



// MARK: - Movie
struct Movie: Codable {
    let artistName: String?
    let trackName: String?
    let artworkLarge: URL?
    let releaseDate: String?
    let country: String?
    let genres: [String]?
    
    enum CodingKeys: String, CodingKey {
        case artistName
        case trackName
        case artworkLarge = "artworkUrl100"
        case releaseDate
        case country
        case genres
    }
}
