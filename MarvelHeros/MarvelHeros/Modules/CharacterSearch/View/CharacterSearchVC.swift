//
//  CharacterSearchVC.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 26/02/2024.
//

import UIKit
import RxSwift

class CharacterSearchVC: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel: CharacterSearchViewModel!
    private let disposeBag = DisposeBag()
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.definesPresentationContext = true
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.delegate = self
        
        let cancelButtonAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        UIBarButtonItem.appearance().setTitleTextAttributes(cancelButtonAttributes , for: .normal)
        
        searchController.searchBar.searchTextField.backgroundColor = .white
        searchController.searchBar.placeholder = "Search...."
        
        return searchController
    }()
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Init
    
    init(viewModel: CharacterSearchViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        searchController.isActive = true
    }
}

// MARK: - SETUP View

extension CharacterSearchVC {
    
    private func setupView() {
        setupNavView()
        bindTableView()
        bindSearchBar()
    }
    
    private func setupNavView() {
        navigationItem.hidesBackButton = true
        navigationItem.titleView = searchController.searchBar
    }
}

// MARK: - Bind

extension CharacterSearchVC {
    
    private func bindSearchBar() {
        
        searchController.searchBar.rx
            .text
            .orEmpty
            .throttle(.microseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .bind(to: viewModel.searchQueryRelay)
            .disposed(by: disposeBag)
    }
    
    
    private func bindTableView() {
        tableView.register(UINib(nibName: SearchResultViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: SearchResultViewCell.identifier)
        
        viewModel
            .searchCharacterList
            .bind(to: tableView.rx
                .items(cellIdentifier: SearchResultViewCell.identifier,
                       cellType: SearchResultViewCell.self)) { ( row, item, cell) in                
                cell.configure(with: item)
            }
                       .disposed(by: disposeBag)
        
        tableView.rx
            .modelSelected(MarvelCharacter.self).subscribe { [weak self] item in
                self?.viewModel.goToCharacterDetails(with: item)
            }
            .disposed(by: disposeBag)
    }
    
}

// MARK: - UISearchControllerDelegate

extension CharacterSearchVC: UISearchControllerDelegate {
    
    func didDismissSearchController(_ searchController: UISearchController) {
        
        navigationController?.popViewController(animated: true)
    }
    
    func didPresentSearchController(_ searchController: UISearchController) {
        
        DispatchQueue.main.async {
            searchController.searchBar.becomeFirstResponder()
        }
    }
    
    
}
