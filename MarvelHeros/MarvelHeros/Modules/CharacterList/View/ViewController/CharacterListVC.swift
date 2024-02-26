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
    
    private lazy var viewSpinner: UIView = {
        let view = UIView(frame: CGRect(
                            x: 0,
                            y: 0,
                            width: view.frame.size.width,
                            height: 100)
        )
        let spinner = UIActivityIndicatorView()
        spinner.center = view.center
        view.addSubview(spinner)
        spinner.startAnimating()
        return view
    }()
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self,
                                 action: #selector(refreshControlTriggered),
                                 for: .valueChanged)
        return refreshControl
    }()
    
    // MARK: - Init
    
    init(viewModel: CharacterListViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
             setupTableView()
        }
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavBarImage()
        bind()
    }
}

// MARK: - SETUP Navigation bar

extension CharacterListVC {
    
    private func addNavBarImage() {
        let navController = navigationController!
        let image = UIImage(named: "icn-nav-marvel")
        let imageView = UIImageView(image: image)
        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height
        let bannerX = bannerWidth / 2 - (image?.size.width)! / 2
        let bannerY = bannerHeight / 2 - (image?.size.height)! / 2
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        navigationItem.rightBarButtonItem = searchButton()
        navigationItem.setHidesBackButton(true, animated: true)
        
    }
    
    private func searchButton() -> UIBarButtonItem {
        UIBarButtonItem(image: UIImage(named: "icn-nav-search")?.withRenderingMode(.alwaysOriginal),
                        style: .plain,
                        target: self,
                        action: #selector(searchButtonTapped))
    }
    
    @objc private func searchButtonTapped(_ sender: Any) {
        viewModel.goToCharacterSearch()
    }
}
 
// MARK: - PRIVATE METHODS

extension CharacterListVC {
    
    private func setupTableView() {
         
         tableView.register(UINib(nibName: CharacterTableViewCell.identifier, bundle: nil),
                            forCellReuseIdentifier: CharacterTableViewCell.identifier)
         tableView.refreshControl = refreshControl
         
     }
    
    private func bind() {
        
        tableViewBind()
        
        viewModel.isLoadingSpinnerAvaliable.subscribe { [weak self] isAvaliable in
            guard let isAvaliable = isAvaliable.element,
                  let self = self else { return }
            self.tableView.tableFooterView = isAvaliable ? self.viewSpinner : UIView(frame: .zero)
        }
        .disposed(by: disposeBag)
        
        viewModel.refreshControlCompelted.subscribe { [weak self] _ in
            guard let self = self else { return }
            self.refreshControl.endRefreshing()
        }
        .disposed(by: disposeBag)
    }
    
    private func tableViewBind() {
        
        viewModel.characterDataItemsRelay.bind(to: tableView.rx.items(cellIdentifier: CharacterTableViewCell.identifier, cellType: CharacterTableViewCell.self)) { (row, character, cell) in
            cell.configure(model: character)
        }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(MarvelCharacter.self).subscribe(onNext: { [weak self] item in
           
            self?.viewModel.goToCharacterDetails(with: item)
        }).disposed(by: disposeBag)
        
        tableView.rx.didScroll.subscribe { [weak self] _ in
            guard let self else { return }
            let offSetY = self.tableView.contentOffset.y
            let contentHeight = self.tableView.contentSize.height
            
            
            if offSetY > (contentHeight - self.tableView.frame.size.height - 100) {
                
                self.viewModel.fetchMoreCharacters()
            }
        }
        .disposed(by: disposeBag)
    }
     
    @objc private func refreshControlTriggered() {
        viewModel.refreshControlAction.onNext(())
    }
}
