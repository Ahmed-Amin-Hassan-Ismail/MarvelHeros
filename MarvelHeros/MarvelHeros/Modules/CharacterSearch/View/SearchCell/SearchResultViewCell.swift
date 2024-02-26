//
//  SearchResultViewCell.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 26/02/2024.
//

import UIKit
import SDWebImage

class SearchResultViewCell: UITableViewCell {
    
    // MARK: - Prpperties
    
    static let identifier = "SearchResultViewCell"
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

// MARK: - Configuration

extension SearchResultViewCell {
    
    func configure(with item: MarvelCharacter) {
        
        self.characterName.text = item.name
        if let url = URL(string: item.thumbnail.full) {
            characterImageView.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
            characterImageView.sd_imageIndicator?.startAnimatingIndicator()
            characterImageView.sd_setImage(with: url,
                                           placeholderImage: nil,
                                           options: .continueInBackground,
                                           context: nil)
        }
        
    }
}
