//
//  CharacterImageViewModel.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 26/02/2024.
//

import Foundation

class CharacterImageViewModel {
    
    // MARK: - Properties
    
    private weak var coordinator: AppCoordinator?
    let item: ComicsItem
    
    // MARK: - Init
    
    init(item: ComicsItem, coordinator: AppCoordinator?) {
        self.item = item
        self.coordinator = coordinator
    }
    
    
}
