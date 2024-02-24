//
//  Coordinator.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 24/02/2024.
//

import Foundation

protocol Coordinator {
    
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController : MarvelNavigationController { get set }
    
    func start()
}
