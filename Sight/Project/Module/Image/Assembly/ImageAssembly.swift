//
//  ImageConfigurator.swift
//  Sight
//
//  Created by enot on 06.09.2018.
//  Copyright (c) 2018 eno0t. All rights reserved.
//

import UIKit

let nameStoryboard = "Main"
let nameController = "ImageViewController"

class ImageAssembly: ImageAssemblyProtocol {

    //MARK: ImageConfigurable
    func configure() -> ImageViewController {
        
        let storyboard = UIStoryboard(name: nameStoryboard, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: nameController) as! ImageViewController
        
    
        let router = ImageRouter(viewController: controller )
        
        let presenter = ImagePresenter(
            output: controller,
            router: router
        )
        
        controller.presenter = presenter
        
        return controller
    }
}
