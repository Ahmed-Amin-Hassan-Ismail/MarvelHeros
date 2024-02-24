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
