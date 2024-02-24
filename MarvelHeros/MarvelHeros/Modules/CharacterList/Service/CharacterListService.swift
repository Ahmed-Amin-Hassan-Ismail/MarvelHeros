//
//  CharacterListService.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 24/02/2024.
//

import Foundation
import RxSwift
import RxAlamofire


final class CharacterListService {
    
    private let disposeBag = DisposeBag()
    
    func fetchCharacterList() {
        
        let batch = Batch.initial
        let paramerter: [String : Any] = [ ParamKeys.limit : batch.limit,
                                             ParamKeys.offset : batch.offset]

        
        let endPoint = EndPoint(path: API.characters,
                                method: .get,
                                parameters: paramerter)
        NetworkManager
            .manager
            .request(endPoint: endPoint)
            .map({
                print($0.0)
            })
            .subscribe { print($0) }
            .disposed(by: disposeBag)
            
    }
    
}


