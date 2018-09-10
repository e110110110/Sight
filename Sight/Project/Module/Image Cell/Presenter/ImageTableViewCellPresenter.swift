//
//  ImageTableViewCellPresenter.swift
//  Sight
//
//  Created by enot on 08.09.2018.
//  Copyright (c) 2018 eno0t. All rights reserved.
//

import Foundation

protocol ImageTableViewCellPresenterInput {
    
    var router: ImageCellRouterProtocol { get }
    func viewDidLoad()
    
}

protocol ImageTableViewCellPresenterOutput: class {
    
}

class ImageTableViewCellPresenter:  ImageTableViewCellPresenterInput {
    
    //MARK: Injections
    private weak var output: ImageTableViewCellPresenterOutput?
    var router: ImageCellRouterProtocol
    
    //MARK: LifeCycle 
    init(output: ImageTableViewCellPresenterOutput,
         router: ImageCellRouterProtocol) {
        
        self.output = output
        self.router = router
    }
    
    //MARK: ImageCellPresenterInput
    func viewDidLoad() {
        
    }
}


