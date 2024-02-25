//
//  URLSession.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 25/02/2024.
//

import Foundation
import RxSwift

protocol URLSessionProtocol {
    
    func data(from url: URL) -> Observable<Data>
    
}

