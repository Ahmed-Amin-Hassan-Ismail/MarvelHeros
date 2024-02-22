//
//  StoryboardMakeable.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 22/02/2024.
//

import UIKit

protocol StoryboardMakeable {
    
    associatedtype StoryboardType
    static var storyboardName: String { get }
    static func initializeFromStoryboard() -> StoryboardType
    
}

extension StoryboardMakeable  where Self: UIViewController {
    
    static func initializeFromStoryboard() -> StoryboardType {
        
        let viewControllerId = String(describing: self)
        
        return initialize(with: viewControllerId)
    }
    
    static func initialize(with viewControllerId: String) -> StoryboardType {
        
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: self))
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerId) as? StoryboardType
        else {
            fatalError("Did not find \(viewControllerId) in \(storyboardName)")
        }
        
        return viewController
        
    }
}
