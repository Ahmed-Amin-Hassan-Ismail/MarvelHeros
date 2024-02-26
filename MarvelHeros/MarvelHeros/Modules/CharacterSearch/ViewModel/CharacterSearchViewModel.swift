//
//  CharacterSearchViewModel.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 26/02/2024.
//

import Foundation
import RxSwift
import RxCocoa


final class CharacterSearchViewModel {
    
    // MARK: - Properties
    
    private weak var coordinator: AppCoordinator!
    private let disposeBag = DisposeBag()
    let characterList = BehaviorRelay(value: [MarvelCharacter]())
    let searchCharacterList = BehaviorRelay(value: [MarvelCharacter]())
    var searchQueryRelay = BehaviorRelay(value: String())
    
    // MARK: - Init
    
    init(items: [MarvelCharacter], coordinator: AppCoordinator) {
        self.coordinator = coordinator
        self.characterList.accept(items)
        self.bind()
    }
    
    func goToCharacterDetails(with item: MarvelCharacter) {
        coordinator.goToCharacterDetails(with: item)
    }
    
    // MARK: - Private Methods
    
    private func bind() {
        searchQueryRelay
            .filter({ !($0.isEmpty) })
            .debug("Filter")
            .map({ [weak self] query -> [MarvelCharacter]? in
                return self?.characterList.value.filter({ $0.name.lowercased().contains(query.lowercased())})
            })
            .compactMap({ $0 })
            .bind(to: searchCharacterList)
            .disposed(by: disposeBag)
    }
    
    
}

extension String {
    func search(query: Self)  -> Bool {
        
        self.lowercased().contains(query.lowercased())
    }
}
