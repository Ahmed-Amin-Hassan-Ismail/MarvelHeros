//
//  EndPoint.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 22/02/2024.
//

import Foundation

// MARK: - HTTP Method

enum HTTPMethod {
    
    case get
    case post
    case put
    case delete
}

// MARK: - API Encoding

enum APIEncoding {
    
    case url
    case json
    case query
}

struct EndPoint {
    
    // MARK: - Properties
    
    var path: String
    var method: HTTPMethod
    var parameters: [String: Any]?
    var encoding: APIEncoding?
    var headers: [String: String]?
    
    
    var fullURL: String {
        
        return "\(environment.baseURL)\(path)"
    }
    
    var fullParameter: [String: Any]?  {
        
        if let parameters {
            
            return Marvel.defaultParameters?.merging(parameters) { (_, new) in new }
        }
            
        return Marvel.defaultParameters
    }
    
    // MARK: - Init
    
    init(path: String,
         method: HTTPMethod,
         parameters: [String : Any]? = nil,
         encoding: APIEncoding? = nil,
         headers: [String : String]? = nil) {
        
        self.path = path
        self.method = method
        self.parameters = parameters
        self.encoding = encoding
        self.headers = headers
    }
}
