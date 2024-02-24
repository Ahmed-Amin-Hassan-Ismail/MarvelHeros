//
//  CharacterListVC.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 22/02/2024.
//

import UIKit
import RxSwift

class CharacterListVC: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel: CharacterListViewModel!
    private let disposeBag = DisposeBag()
    
    // MARK: - Init
    
    init(viewModel: CharacterListViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
