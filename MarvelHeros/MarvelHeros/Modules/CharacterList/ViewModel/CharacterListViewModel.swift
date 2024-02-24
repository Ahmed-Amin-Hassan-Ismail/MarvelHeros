//
//  CharacterListViewModel.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 24/02/2024.
//

import Foundation

final class CharacterListViewModel {
    
    // MARK: - Properties
    
    private weak var coordinator: AppCoordinator!
    //private var service:
    
    // MARK: - Init
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        
        
    }
    
    
    // MARK: - Api calling
    
    private func fetchCharacterList() {
        
        let batch = Batch.initial
        let paramerter: [String : Any] = [ ParamKeys.limit : batch.limit,
                                             ParamKeys.offset : batch.offset]


        let endPoint = EndPoint(path: API.characters,
                                method: .get,
                                parameters: paramerter)

NetworkManager.manager.request(endPoint: endPoint)
    .subscribe { response, data in
        if let result = try? JSONDecoder().decode(CharacterModel.self, from: data) {
            var characters: [Character]?
            characters = result.data?.results
            print("This characters \(characters)")
        }
    }
    //.disposed(by: disposeBag)
        
    }
    
}
