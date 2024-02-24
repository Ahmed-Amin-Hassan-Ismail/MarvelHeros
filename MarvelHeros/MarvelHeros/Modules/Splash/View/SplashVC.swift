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
    
    private var viewModel: SplashViewModel!
    
    // MARK: - Init
    
    init(viewModel: SplashViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var lottieAnimationView: LottieAnimationView! {
        didSet {
            viewModel.setupLottieAnimation(view: lottieAnimationView)
        }
    }
    
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.startAnimation(view: lottieAnimationView)
    }

}
