//
//  APIClient.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 24/02/2024.
//

import Foundation
import Alamofire
import RxSwift


protocol APIClientProtocol {
    
    func request(endPoint: EndPoint) -> Observable<Data>
}
