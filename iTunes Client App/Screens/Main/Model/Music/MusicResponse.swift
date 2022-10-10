//
//  MusicResponse.swift
//  iTunes Client App
//
//  Created by Muhammed Yusuf Kaynak on 8.10.2022.
//

import Foundation

struct MusicResponse: Decodable {
    let resultCount: Int?
    let results: [Music]?
}
