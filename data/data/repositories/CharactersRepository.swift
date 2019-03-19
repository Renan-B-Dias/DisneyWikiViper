//
//  CharactersRepository.swift
//  data
//
//  Created by Renan Benatti Dias on 18/03/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import RxSwift

protocol CharactersAPIProtocol {
    
    func getAllCharacters() -> Single<[CharacterAPI]>
    func getCharacter(id: Int) -> Single<CharacterAPI>
}

public protocol CharactersRepositoryProtocol {
    
    func getAllCharacters() -> Single<[CharacterAPI]>
    func getCharacter(id: Int) -> Single<CharacterAPI>
}

public final class CharactersRepository {
    
    private let apiClient: CharactersAPIProtocol = APIClient()
    
    public init() {}
}

extension CharactersRepository: CharactersRepositoryProtocol {

    public func getAllCharacters() -> Single<[CharacterAPI]> {
        return apiClient.getAllCharacters()
    }
    
    public func getCharacter(id: Int) -> Single<CharacterAPI> {
        return apiClient.getCharacter(id: id)
    }
}
