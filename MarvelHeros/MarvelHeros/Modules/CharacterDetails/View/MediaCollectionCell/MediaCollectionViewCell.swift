//
//  MediaCollectionViewCell.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 26/02/2024.
//

import UIKit
import SDWebImage

class MediaCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "MediaCollectionViewCell"
    
    // MARK: - IBOutlets
    
    @IBOutlet private var comicImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

// MARK: Configurations

extension MediaCollectionViewCell {
    
    func configure(with item: ComicsItem) {
        nameLabel.text = item.name
        if let url = URL(string: item.url ?? "") {
            comicImageView.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
            comicImageView.sd_imageIndicator?.startAnimatingIndicator()
            comicImageView.sd_setImage(with: url,
                                           placeholderImage: nil,
                                           options: .continueInBackground,
                                           context: nil)
        }
    }
}
