//
//  MovieResponse.swift
//  iTunes Client App
//
//  Created by Muhammed Yusuf Kaynak on 10.10.2022.
//

import Foundation

struct MovieResponse: Decodable {
    let resultCount: Int?
    let results: [Movie]?
}
