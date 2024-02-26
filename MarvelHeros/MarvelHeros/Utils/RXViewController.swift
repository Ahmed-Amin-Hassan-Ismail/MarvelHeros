//
//  RXViewController.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 24/02/2024.
//

import UIKit
import RxSwift

class RXViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavBarImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    private func addNavBarImage() {
        let navController = navigationController!
        let image = UIImage(named: "icn-nav-marvel")
        let imageView = UIImageView(image: image)
        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height
        let bannerX = bannerWidth / 2 - (image?.size.width)! / 2
        let bannerY = bannerHeight / 2 - (image?.size.height)! / 2
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        navigationItem.rightBarButtonItem = searchButton()
        navigationItem.setHidesBackButton(true, animated: true)
        
    }
    
    private func searchButton() -> UIBarButtonItem {
        UIBarButtonItem(image: UIImage(named: "icn-nav-search")?.withRenderingMode(.alwaysOriginal),
                        style: .plain,
                        target: self,
                        action: #selector(searchButtonTapped))
    }
    
    @objc private func searchButtonTapped(_ sender: Any) {
        print("Search bar tapped")
    }
}
