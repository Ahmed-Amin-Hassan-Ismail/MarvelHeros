//
//  MediaTableViewCell.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 26/02/2024.
//

import UIKit
import RxSwift
import RxCocoa

class MediaTableViewCell: UITableViewCell {
    
     // MARK: - Properties
    static let identifier = "MediaTableViewCell"
    private let disposeBag = DisposeBag()
    let selectedCharacter = PublishSubject<ComicsItem>()
    
    // MARK: Outlets

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var collectionView: UICollectionView!
    
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

extension MediaTableViewCell {
    
    func configure(name: String, items: BehaviorRelay<[ComicsItem]>) {
        titleLabel.text = name
        configureCollectionView(items: items)
    }
    
   private func configureCollectionView(items: BehaviorRelay<[ComicsItem]>) {
       
       collectionView.register(UINib(nibName: MediaCollectionViewCell.identifier, bundle: nil),
                               forCellWithReuseIdentifier: MediaCollectionViewCell.identifier)
       
        items.bind(to: collectionView.rx.items(cellIdentifier: MediaCollectionViewCell.identifier, cellType: MediaCollectionViewCell.self)) {
            (row, item, cell) in
            var updatedItem = item
            updatedItem.url = MockURLImages.urls.shuffled()[row]
            cell.configure(with: updatedItem)
        }
        .disposed(by: disposeBag)
        
        collectionView.rx.modelSelected(ComicsItem.self).subscribe { [weak self] item in
            self?.selectedCharacter.onNext(item)
        }
        .disposed(by: disposeBag)
    }
}
