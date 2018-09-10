//
//  ImageCellRouter.swift
//  Sight
//
//  Created by enot on 08.09.2018.
//  Copyright (c) 2018 eno0t. All rights reserved.
//

import UIKit

class ImageCellRouter: ImageCellRouterProtocol {
    
    //MARK: Injections
    private weak var viewController: ImageTableViewCell?
    
    //MARK: LifeCycle
    init(viewController: ImageTableViewCell) {
        self.viewController = viewController
    }
    
    //MARK: ImageCellRoutable

}


