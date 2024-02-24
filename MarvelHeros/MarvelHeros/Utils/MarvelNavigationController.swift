//
//  MarvelNavigationController.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 24/02/2024.
//

import UIKit

class MarvelNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let logoView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        logoView.image = UIImage(named: "icn-nav-marvel")
        logoView.contentMode = .scaleAspectFit
        
        navigationBar.tintColor = .white
        navigationBar.barTintColor = .black
        navigationBar.topItem?.titleView = logoView
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: nil, action: nil)
        
        
    }

}
