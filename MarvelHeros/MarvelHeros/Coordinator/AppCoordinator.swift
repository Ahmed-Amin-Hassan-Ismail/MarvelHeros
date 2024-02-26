//
//  AppCoordinator.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 24/02/2024.
//

import Foundation
import UIKit


final class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    // MARK: - Init
    
    init(navCon : UINavigationController) {
        self.navigationController = navCon
    }
    
    func start() {
        
        goToSplashScreen()
    }
    
    func goToHome() {
        let viewModel = CharacterListViewModel(coordinator: self)
        let viewController = CharacterListVC(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func goToCharacterDetails(with item: MarvelCharacter) {
        let viewModel = CharacterDetailsViewModel(with: item, coordinator: self)
        let viewController = CharacterDetailsVC(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func goToCharacterImage(with item: ComicsItem) {
        let viewModel = CharacterImageViewModel(item: item, coordinator: self)
        let viewController = CharacterImageVC(viewModel: viewModel)
        viewController.modalPresentationStyle = .fullScreen
        navigationController.present(viewController, animated: true)
    }
    
    func goToCharacterSearch(with items: [MarvelCharacter]) {
        let viewModel = CharacterSearchViewModel(items: items, coordinator: self)
        let viewController = CharacterSearchVC(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - Private Methods

extension AppCoordinator {
    
    private func goToSplashScreen() {
        let viewModel = SplashViewModel(coordinator: self)
        let viewController = SplashVC(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
