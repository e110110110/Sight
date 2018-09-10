//
//  ImageRouter.swift
//  Sight
//
//  Created by enot on 06.09.2018.
//  Copyright (c) 2018 eno0t. All rights reserved.
//

import UIKit

class ImageRouter: ImageRouterProtocol {
    
    private weak var viewController: ImageViewController?
    
    init(viewController: ImageViewController) {
        self.viewController = viewController
    }
    
    func chooseImage(_ alert: UIAlertController) {
        viewController?.present(alert,
                                animated: true,
                                completion: {})
    }
    
    func showImagePicker(_ imagePicker: UIImagePickerController) {
        viewController?.present(imagePicker,
                                animated: true,
                                completion: nil)
    }
    
    func showErrorAlert(_ message: String) {
        let alert = UIAlertController(title: "Произошла ошибка",
                                      message: message,
                                      preferredStyle: .alert)
        let cancel = UIAlertAction(title: "ОК",
                                   style: .default,
                                   handler: nil)
        
        alert.addAction(cancel)
        viewController?.present(alert,
                                animated: true,
                                completion: nil)
    }
    
    func showDownloadAlert(_ alert: UIAlertController) {
        viewController?.present(alert,
                                animated: true,
                                completion: nil)
    }
}


