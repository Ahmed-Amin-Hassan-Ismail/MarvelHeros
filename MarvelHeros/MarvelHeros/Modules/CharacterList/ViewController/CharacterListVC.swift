//
//  CharacterListVC.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 22/02/2024.
//

import UIKit

class CharacterListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

// MARK: - Setup Navigation

extension CharacterListVC {
    
    class func initializeWithNavigationController() -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: CharacterListVC.initializeFromStoryboard())
        nav.modalPresentationStyle = .fullScreen
        
        return nav
    }
}

extension CharacterListVC: StoryboardMakeable {
    
    typealias StoryboardType = CharacterListVC
    static var storyboardName: String = Storyboard.characterList
}
