//
//  MarvelCharacter.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 24/02/2024.
//

import Foundation


// MARK: - Character

struct MarvelCharacter: Codable {
    
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
    var name: String?
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int
}

// MARK: - ComicsItem

class ComicsItem: Codable {
    let resourceURI: String
    let name: String
    var url: String?
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
