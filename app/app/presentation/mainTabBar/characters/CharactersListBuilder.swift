//
//  CharactersListBuilder.swift
//  app
//
//  Created by Renan Benatti Dias on 18/03/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import UIKit
import domain

enum CharactersListBuilder {
    
    static func build() -> UIViewController {
        let interactor = CharactersListInteractor()
        let presenter = CharactersListPresenter(interactor: interactor)
        return CharactersListViewController(presenter: presenter)
    }
}
