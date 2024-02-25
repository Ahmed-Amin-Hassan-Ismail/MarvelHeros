//
//  MarvelModel.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 24/02/2024.
//

import Foundation

struct MarvelModel: Codable {
    
    var data: MarvelCharacters?
}

struct MarvelCharacters: Codable {
    
    var offset: Int?
    var limit: Int?
    var total: Int?
    var count: Int?
    var characters: [MarvelCharacter]?
    
    var batch: Batch {
        
        Batch(offset: offset ?? 0, limit: limit ?? 0, total: total ?? 0, count: count ?? 0)
    }
    
    enum CodingKeys: String, CodingKey {
        
        case offset
        case limit
        case total
        case count
        case characters = "results"
    }
}
