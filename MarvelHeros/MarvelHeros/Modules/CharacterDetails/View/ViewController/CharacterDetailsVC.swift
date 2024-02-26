//
//  CharacterDetailsVC.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 26/02/2024.
//

import UIKit
import RxSwift
import RxCocoa

class CharacterDetailsVC: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel: CharacterDetailsViewModel!
    private let disposeBag = DisposeBag()
    
    // MARK: - Init
    
    init(viewModel: CharacterDetailsViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet private var headerView: CharacterDetailsHeaderView!
    

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

// MARK: - SETUP

extension CharacterDetailsVC {
    
    private func setupView() {
        setupHeaderView()
        bindTableView()
    }
    
    private func setupHeaderView() {
        headerView.configure(with: viewModel.item)
        headerView.buttonAction.subscribe { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }
        .disposed(by: disposeBag)
    }
    
    private func bindTableView() {
        tableView.register(UINib(nibName: MediaTableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: MediaTableViewCell.identifier)
        
        viewModel.marvelSections.bind(to: tableView.rx.items(cellIdentifier: MediaTableViewCell.identifier, cellType: MediaTableViewCell.self)) { (row, item, cell) in
            cell.configure(name: item.name ?? "", items: BehaviorRelay(value: item.items))
        }
        .disposed(by: disposeBag)
    }
}
