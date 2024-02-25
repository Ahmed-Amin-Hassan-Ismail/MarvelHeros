//
//  CharacterTableViewCell.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 24/02/2024.
//

import UIKit
import SDWebImage

class CharacterTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "CharacterTableViewCell"
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    // MARK: - Configure
    
    func configure(model: MarvelCharacter) {
        if let url = URL(string: model.thumbnail.full) {
            characterImageView.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
            characterImageView.sd_imageIndicator?.startAnimatingIndicator()
            characterImageView.sd_setImage(with: url,
                                           placeholderImage: nil,
                                           options: .continueInBackground,
                                           context: nil)
        }
        characterNameLabel.text = model.name
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
