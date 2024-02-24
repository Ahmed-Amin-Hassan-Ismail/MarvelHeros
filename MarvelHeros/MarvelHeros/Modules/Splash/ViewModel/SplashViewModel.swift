//
//  SplashViewModel.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 22/02/2024.
//

import Foundation
import Lottie
import UIKit

final class SplashViewModel {
    
    // MARK: - Properties
    
   private var coordinator: AppCoordinator!
    
    
    // MARK: - Init
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    // MARK: - Methods
    
    func setupLottieAnimation(view: LottieAnimationView) {
        
        view.animation = LottieAnimation.named("Animation")
        view.backgroundBehavior = .pauseAndRestore
        view.contentMode = .scaleAspectFill
    }
    
    func startAnimation(view: LottieAnimationView) {
        view.play { [weak self] completed in
            if completed {
                self?.goToHome()
            }
        }
    }
    
  private func goToHome() {
        coordinator.goToHome()
    }
    
}
