//
//  Batch.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 24/02/2024.
//

import Foundation


struct Batch: Codable {
    
    var offset: Int
    var limit: Int
    var total: Int
    var count: Int
    
    
    static var initial: Batch {
       return Batch(offset: 0, limit: 30, total: Int.max, count: Int.max)
    }
    
    var hasNextPage: Bool {
       return !(offset == total || offset + count == total)
    }
    
    func next() -> Batch {
       return Batch(offset: offset + count, limit: limit, total: total, count: count)
    }
}
