//
//  ImageCellConfigurator.swift
//  Sight
//
//  Created by enot on 08.09.2018.
//  Copyright (c) 2018 eno0t. All rights reserved.
//

import UIKit

class ImageCellAssambly: ImageCellAssamblyProtocol {

    //MARK: ImageCellConfigurable
    func configure(viewController: ImageTableViewCell) {
    
        let router = ImageCellRouter(viewController: viewController)
        
        let presenter = ImageTableViewCellPresenter(
            output: viewController,
            router: router
        )
        
        viewController.presenter = presenter
    }
}
