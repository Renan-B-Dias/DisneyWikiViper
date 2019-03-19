//
//  CharactersListPresenter.swift
//  app
//
//  Created by Renan Benatti Dias on 18/03/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import RxSwift
import RxCocoa
import domain

final class CharactersListPresenter: BasePresenter {
    
    private let getCharactersSubject = PublishSubject<Void>()
    
    private let interactor: CharactersListInteractorProtocol

    init(interactor: CharactersListInteractorProtocol) {
        self.interactor = interactor
    }
}

extension CharactersListPresenter: CharactersListPresenterProtocol {
    
    var viewModels: Driver<[CharacterTableViewCellProtocol]> {
        return getCharactersSubject
            .flatMap { [unowned self] in self.interactor.getAllCharacters() }
            .do(onNext: { (_) in
                print("On normal.....")
            }, onError: { (error) in
                print("On error.....")
                print(error.localizedDescription)
            }, onSubscribed: {
                print("On loading.....")
            })
            .map { $0.map { CharacterTableViewCellModel(name: $0.fullName, imageURL: nil) } }
            .asDriver(onErrorJustReturn: [])
    }
    
    func viewDidLoad() {
        getCharactersSubject.onNext(())
    }
}
