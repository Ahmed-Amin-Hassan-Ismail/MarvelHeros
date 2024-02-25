//
//  Thumbnail.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 24/02/2024.
//

import Foundation



// MARK: - Thumbnail
struct Thumbnail: Codable {
    
    let path: String
    let thumbnailExtension: Extension
    
    var full: String {
        return path + "." + thumbnailExtension.rawValue
    }

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
    case png = "png"
}
