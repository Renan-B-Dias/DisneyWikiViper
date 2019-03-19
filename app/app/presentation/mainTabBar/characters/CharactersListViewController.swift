//
//  CharactersListViewController.swift
//  app
//
//  Created by Renan Benatti Dias on 18/03/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import UIKit
import Cartography
import RxSwift
import RxCocoa

protocol CharactersListPresenterProtocol {
    
    var viewModels: Driver<[CharacterTableViewCellProtocol]> { get }
    
    func viewDidLoad()
}

final class CharactersListViewController: BaseViewController {
    
    private var presenter: CharactersListPresenterProtocol {
        return basePresenter as! CharactersListPresenterProtocol
    }
    
    private let tableView = UITableView(frame: .zero)
    
    private var viewModels: [CharacterTableViewCellProtocol] = []
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(tableView)
        constrain(view, tableView) { (view, tableView) in
            tableView.edges == view.edges
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CharacterTableViewCell", bundle: nil), forCellReuseIdentifier: "CharacterTableViewCell")
        
        title = "Characters"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        presenter.viewDidLoad()
    }
    
    override func bind() {
        super.bind()
        
        presenter.viewModels
            .drive(onNext: { [weak self] (viewModels) in
                guard let self = self else { return }
                self.viewModels = viewModels
                self.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
}

extension CharactersListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath) as? CharacterTableViewCell {
            cell.bind(viewModel: viewModels[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
