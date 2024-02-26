//
//  CharacterListViewModel.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 24/02/2024.
//

import Foundation
import RxSwift
import RxCocoa

final class CharacterListViewModel {
    
    // MARK: - Properties
    
    private weak var coordinator: AppCoordinator!
    private let disposeBag = DisposeBag()
    
    let characterDataItemsRelay = BehaviorRelay<[MarvelCharacter]>(value: [])
    private lazy var batch: Batch = .initial
    
    let refreshControlAction = PublishSubject<Void>()
    let refreshControlCompelted = PublishSubject<Void>()
    let isLoadingSpinnerAvaliable = PublishSubject<Bool>()
    
    // MARK: - Init
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        self.bind()
    }
    
    // MARK: - Methods
    
    func fetchMoreCharacters() {
        
        if batch.hasNextPage {
            
            fetchCharacterList(batch: batch.next())
        }
    }
    
    func goToCharacterSearch() {
        coordinator.goToCharacterSearch(with: characterDataItemsRelay.value)
    }
    
    func goToCharacterDetails(with item: MarvelCharacter) {
        coordinator.goToCharacterDetails(with: item)
    }
    
    private func bind() {
        
        fetchCharacterList(batch: batch)
        
        refreshControlAction.subscribe { [weak self] _ in
            self?.refreshControlTriggered()
        }
        .disposed(by: disposeBag)
    }
    
    private func refreshControlTriggered() {
        
        characterDataItemsRelay.accept([])
        batch = .initial
    }
    
    
    // MARK: - Api calling
        
    private func fetchCharacterList(batch: Batch) {
        
        let paramerter: [String : Any] = [ ParamKeys.limit : batch.limit,
                                           ParamKeys.offset : batch.offset]
        
        
        let endPoint = EndPoint(path: API.characters,
                                method: .get,
                                parameters: paramerter)
        
        isLoadingSpinnerAvaliable.onNext(true)
        
        NetworkManager
            .manager
            .request(endPoint: endPoint)
            .decode(type: MarvelModel.self, decoder: JSONDecoder())
            .subscribe(onNext: { [weak self] model in
                guard let self else { return }
                self.batch = model.data?.batch ?? .initial
                let oldData = self.characterDataItemsRelay.value
                self.characterDataItemsRelay.accept(oldData + (model.data?.characters ?? []))
            }, onCompleted: {
                self.isLoadingSpinnerAvaliable.onNext(false)
                self.refreshControlCompelted.onNext(())
            })
            .disposed(by: disposeBag)
    }
    
}
