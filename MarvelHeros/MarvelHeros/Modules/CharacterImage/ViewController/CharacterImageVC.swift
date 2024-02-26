//
//  CharacterImageVC.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 26/02/2024.
//

import UIKit
import SDWebImage

class CharacterImageVC: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel: CharacterImageViewModel!
    
    // MARK: - Init
    
    init(viewModel: CharacterImageViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    // MARK: - IBActions
    
    @IBAction func dismissAction(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }


    func setupView() {
        
        characterImageView.sd_setImage(with: URL(string: viewModel.item.url ?? ""))
        characterNameLabel.text = viewModel.item.name
    }

}
