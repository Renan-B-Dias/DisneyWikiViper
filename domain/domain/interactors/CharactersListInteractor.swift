//
//  CharactersListInteractor.swift
//  domain
//
//  Created by Renan Benatti Dias on 18/03/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import RxSwift
import data

public protocol CharactersListInteractorProtocol {
    
    func getAllCharacters() -> Single<[Character]>
}

public final class CharactersListInteractor {
    
    private let repository: CharactersRepositoryProtocol = CharactersRepository()
    
    public init() {}
}

extension CharactersListInteractor: CharactersListInteractorProtocol {
    
    public func getAllCharacters() -> Single<[Character]> {
        return repository.getAllCharacters()
            .map { $0.compactMap { Character(characterAPI: $0) } }
    }
}
