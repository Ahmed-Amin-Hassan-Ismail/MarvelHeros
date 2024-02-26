//
//  CharacterDetailsViewModel.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 26/02/2024.
//

import Foundation
import RxSwift
import RxCocoa

final class CharacterDetailsViewModel {
    
    // MARK: - Properties
    
    private weak var coordinator: AppCoordinator!
    //private let disposeBag = DisposeBag()
    
    let marvelSections = BehaviorRelay(value: [Comics]())
    var item: MarvelCharacter
    
    // MARK: - Init
    
    init(with item: MarvelCharacter, coordinator: AppCoordinator) {
        self.item = item
        self.coordinator = coordinator
        self.bind()
    }
    
    private func bind() {
        var comics = item.comics
        comics.name = "Comics"
        
        var series = item.series
        series.name = "Series"
        
        var events = item.comics
        events.name = "Events"
        
        let values = [comics, series, events]
        marvelSections.accept(values)
    }
}
