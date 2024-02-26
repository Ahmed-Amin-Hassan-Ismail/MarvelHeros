//
//  CharacterDetailsHeaderView.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 26/02/2024.
//

import UIKit
import RxSwift
import SDWebImage

final class CharacterDetailsHeaderView: UIView {
    
    // MARK: - Properties
    
    var buttonAction = PublishSubject<Void>()
    
    // MARK: Outlets

    @IBOutlet private var characterImageView: UIImageView!
    @IBOutlet private var nameValueLabel: UILabel!
    @IBOutlet private var descriptionValueLabel: UILabel!
    
    @IBAction func popView(_ sender: UIButton) {
        buttonAction.onNext(())
    }
}

// MARK: Configurations

extension CharacterDetailsHeaderView {
    
    func configure(with item: MarvelCharacter) {
        if let url = URL(string: item.thumbnail.full) {
            characterImageView.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
            characterImageView.sd_imageIndicator?.startAnimatingIndicator()
            characterImageView.sd_setImage(with: url,
                                           placeholderImage: nil,
                                           options: .continueInBackground,
                                           context: nil)
        }
        nameValueLabel.text = item.name
        descriptionValueLabel.text = item.description
    }
}
