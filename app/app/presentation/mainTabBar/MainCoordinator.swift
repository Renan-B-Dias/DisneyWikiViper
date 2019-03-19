//
//  MainCoordinator.swift
//  app
//
//  Created by Renan Benatti Dias on 18/03/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import UIKit

final class TabCoordinator {
    
    private let tabViewController = MainTabBarBuilder.build()
    
    func start(window: UIWindow) {
        window.rootViewController = tabViewController
        window.makeKeyAndVisible()
        addTabs()
    }
    
    private func addTabs() {
        let charactersListViewController = CharactersListBuilder.build()
        charactersListViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 0)
        
        let viewControllers = [
            charactersListViewController
        ]
        
        tabViewController.setViewControllers(viewControllers, animated: true)
    }
}
