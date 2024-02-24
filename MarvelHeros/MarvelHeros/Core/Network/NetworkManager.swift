//
//  NetworkManager.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 24/02/2024.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire


class NetworkManager: HTTPClient {
    
    static var manager: NetworkManager {
        return NetworkManager()
    }
    
    private init() { }
    
    func request(endPoint: EndPoint) -> Observable<(response: HTTPURLResponse, data: Data)> {
        URLSession.shared.rx
            .response(method: httpMethod(forEndPoint: endPoint),
                      endPoint.fullURL,
                      parameters: endPoint.fullParameter,
                      encoding: encoding(forEndPoint: endPoint),
                      headers: headers(endPoint: endPoint))
            .observe(on: MainScheduler.instance)
    }
}

extension NetworkManager {
    
    
    func httpMethod(forEndPoint endPoint: EndPoint) -> Alamofire.HTTPMethod {
        
        switch endPoint.method {
            
        case .get:
            return .get
            
        case .post:
            return .post
            
        case .put:
            return .put
            
        case .delete:
            return .delete
            
        }
    }
    
    
    func encoding(forEndPoint endPoint: EndPoint) -> Alamofire.ParameterEncoding {
        
        if let encoding = endPoint.encoding {
            
            return parameterEncoding(forAPIEncoding: encoding)
        }
        
        switch endPoint.method {
            
        case .get:
            return URLEncoding.default
            
        case .post:
            return JSONEncoding.default
            
        default:
            return JSONEncoding.default
        }
    }
    
    func parameterEncoding(forAPIEncoding apiEncoding: APIEncoding) -> Alamofire.ParameterEncoding {
        
        switch apiEncoding {
            
        case .url:
            return URLEncoding.default
            
        case .json:
            return JSONEncoding.default
            
        case .query:
            return URLEncoding.queryString
            
        }
    }
    
    func headers(endPoint: EndPoint) -> Alamofire.HTTPHeaders {
        
        var headers: HTTPHeaders = [:]
        
        headers = defaultHTTPHeaders()
        
        
        guard let endPointHeaders = endPoint.headers else {
            
            return headers
        }
        
        for header in endPointHeaders {
            headers.add(name: header.key, value: header.value)
        }
        
        return headers
        
    }
    
    func defaultHTTPHeaders() -> Alamofire.HTTPHeaders {
        
        return [
            "Content-Type":"application/json",
            "Accept":"application/json"
        ]
    }
}
