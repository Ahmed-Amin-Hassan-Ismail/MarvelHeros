//
//  HTTPClient.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 24/02/2024.
//

import Foundation
import Alamofire
import RxSwift


protocol HTTPClient {
    
    func request(endPoint: EndPoint) -> Observable<(response: HTTPURLResponse, data: Data)>
}
