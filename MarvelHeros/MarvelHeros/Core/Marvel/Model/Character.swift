//
//  Character.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 24/02/2024.
//

import Foundation

//struct Character: Codable {
//    var id: Int?
//    var name: String
//    var thumbnail: Thumbnail?
//}



// MARK: - CharacterModel

struct CharacterModel: Codable {
    
    var code: Int?
    var status, copyright, attributionText, attributionHTML: String?
    var etag: String?
    var data: DataClass?
}

// MARK: - DataClass

struct DataClass: Codable {
    
    var offset, limit, total, count: Int?
    var results: [Character]?
}

// MARK: - Result
struct Character: Codable {
    let id: Int
    let name, description: String
    let thumbnail: Thumbnail
    let resourceURI: String
    let comics, series: Comics
    let stories: Stories
    let events: Comics
    let urls: [URLElement]
}

// MARK: - Comics
struct Comics: Codable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    let resourceURI: String
    let name: String
}

// MARK: - Stories
struct Stories: Codable {
    let available: Int
    let collectionURI: String?
    let items: [StoriesItem?]
    let returned: Int
}

// MARK: - StoriesItem
struct StoriesItem: Codable {
    let resourceURI: String?
    let name: String?
    let type: ItemType?
}

enum ItemType: String, Codable {
    
    case ad = "ad"
    case backcovers = "backcovers"
    case cover = "cover"
    case empty = ""
    case interiorStory = "interiorStory"
    case pinUp = "pin-up"
    case pinup = "pinup"
    case profile = "profile"
    case recap = "recap"
    case textArticle = "text article"
    case textFeature = "text feature"
    case letters = "letters"
    case mysteryStory = "mystery story"
    case promo = "promo"
    case textStory = "text story"
    case activity = "activity"
    case statementOfOwnership = "statement of ownership"
    case tradingCardInsert = "trading card insert"
    
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: Extension

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

// MARK: - URLElement
struct URLElement: Codable {
    let type: URLType
    let url: String
}

enum URLType: String, Codable {
    case comiclink = "comiclink"
    case detail = "detail"
    case wiki = "wiki"
}
