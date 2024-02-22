//
//  Environment.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 22/02/2024.
//

import Foundation


#if DEBUG
let environment: Environment = .debug
#endif



enum Environment {
    
    case debug
    
    var baseURL: String {
        switch self {
        case .debug:
            return BaseURL.debug
        }
    }
}
