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
    
    
    // MARK: - Methods
    
    func setupLottieAnimation(view: LottieAnimationView) {
        
        view.animation = LottieAnimation.named("Animation")
        view.backgroundBehavior = .pauseAndRestore
        view.contentMode = .scaleAspectFill
    }
    
}
