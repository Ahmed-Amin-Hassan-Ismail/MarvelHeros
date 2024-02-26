//
//  Marvel.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 24/02/2024.
//

import Foundation


struct Marvel {
    
    // MARK: - PRIVATE
    
    private struct Keys {
        
        static let privatKey = "9597bcd0e2339d5874d9913140b581ed0b55a921"
        static let publicKey = "be23153c199affa766dc9fe6f34fd524"
    }
    
    
    private static let dateFormatter: DateFormatter = {
       let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        
        return dateFormatter
    }()
    
    
    static var defaultParameters: [String: Any]? {
        let timeStamp = dateFormatter.string(from: Date())
        let hash = "\(timeStamp)\(Keys.privatKey)\(Keys.publicKey)".MD5
        
        let parameters: [String: Any]? = [
            ParamKeys.apikey : Keys.publicKey,
            ParamKeys.hash : hash,
            ParamKeys.timeStamp : timeStamp,
        ]
        
        return parameters
    }
}


struct MockURLImages: Codable {
    static let urls = [
        "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg",
        "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16.jpg",
        "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec.jpg",
        "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg",
        "http://i.annihil.us/u/prod/marvel/i/mg/9/50/4ce18691cbf04.jpg",
        "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg",
        "http://i.annihil.us/u/prod/marvel/i/mg/1/b0/5269678709fb7.jpg",
        "http://i.annihil.us/u/prod/marvel/i/mg/9/30/535feab462a64.jpg",
        "http://i.annihil.us/u/prod/marvel/i/mg/3/80/4c00358ec7548.jpg",
        "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg",
        "http://i.annihil.us/u/prod/marvel/i/mg/1/b0/5269678709fb7.jpg",
        "http://i.annihil.us/u/prod/marvel/i/mg/9/30/535feab462a64.jpg",
        "http://i.annihil.us/u/prod/marvel/i/mg/3/80/4c00358ec7548.jpg",
        "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg",
        "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16.jpg",
        "http://i.annihil.us/u/prod/marvel/i/mg/1/b0/5269678709fb7.jpg",
        "http://i.annihil.us/u/prod/marvel/i/mg/9/30/535feab462a64.jpg",
        "http://i.annihil.us/u/prod/marvel/i/mg/3/80/4c00358ec7548.jpg",
        "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg",
        "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16.jpg"
    ]
}
