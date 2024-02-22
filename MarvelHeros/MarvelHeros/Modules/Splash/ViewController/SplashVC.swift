//
//  SplashVC.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 22/02/2024.
//

import UIKit
import Lottie

class SplashVC: UIViewController {
    
    // MARK: - Properties
    
    private lazy var viewModel: SplashViewModel = {
       let viewModel = SplashViewModel()
        
        return viewModel
    }()
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var lottieAnimationView: LottieAnimationView! {
        didSet {
            viewModel.setupLottieAnimation(view: lottieAnimationView)
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        lottieAnimationView.play { completed in
            if completed {
                UIApplication.shared.mainKeyWindow?.rootViewController = CharacterListVC.initializeWithNavigationController()
            }
        }
    }

}

// MARK: - StoryboardMakeable

extension SplashVC: StoryboardMakeable {
 
    typealias StoryboardType = SplashVC
    static var storyboardName: String = Storyboard.spalsh
}
