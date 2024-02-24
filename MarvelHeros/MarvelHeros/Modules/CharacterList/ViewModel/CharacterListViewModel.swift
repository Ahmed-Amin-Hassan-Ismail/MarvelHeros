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
    
    // MARK: - Init
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
}
