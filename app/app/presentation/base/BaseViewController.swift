//
//  BaseViewController.swift
//  app
//
//  Created by Renan Benatti Dias on 18/03/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import UIKit
import RxSwift

protocol BasePresenterProtocol {
    
}

class BaseViewController: UIViewController {
    
    let basePresenter: BasePresenterProtocol
    
    let disposeBag = DisposeBag()
    
    init(presenter: BasePresenterProtocol) {
        self.basePresenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    internal func bind() {
        
    }
}
