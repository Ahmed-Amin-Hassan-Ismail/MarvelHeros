//
//  AppCoordinator.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 24/02/2024.
//

import Foundation


final class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: MarvelNavigationController
    
    // MARK: - Init
    
    init(navCon : MarvelNavigationController) {
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
}

// MARK: - Private Methods

extension AppCoordinator {
    
    private func goToSplashScreen() {
        let viewModel = SplashViewModel(coordinator: self)
        let viewController = SplashVC(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
