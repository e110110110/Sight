//
//  ImageViewControllerAlertControllerExtension.swift
//  Sight
//
//  Created by enot on 09.09.2018.
//  Copyright © 2018 eno0t. All rights reserved.
//

import Foundation
import UIKit

extension ImageViewController: ImageViewControllerProtocol {
    
    func createDownloadAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Скачать",
                                      message: "Введите URL",
                                      preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.textColor       = UIColor.blue
            textField.placeholder     = "URL"
            textField.borderStyle     = UITextBorderStyle.roundedRect
            textField.clearButtonMode = UITextFieldViewMode.whileEditing
        }
        
        let downloadAction = UIAlertAction(title: "ОК",  style: .default) { (action) in
            if let textField = alert.textFields?.first {
                if let url = textField.text {
                    if url.count > 0 {
                        self.presenter.startDownload(url: url)
                    }
                }
            }
        }
        
        let cancel = UIAlertAction(title: "Отмена",
                                   style: .cancel,
                                   handler: nil)
        
        alert.addAction(downloadAction)
        alert.addAction(cancel)
        return alert
    }
    
    func createChooseImage(view: UIView) -> UIAlertController {
        let alert = UIAlertController(title: "Выберите источник",
                                      message: nil,
                                      preferredStyle: .actionSheet)
        
        let photoGallery = UIAlertAction(title: "Галерия",
                                         style: .default) {
                                            (action) in
           self.presenter.imagePicker(.photoLibrary)
        }
        
        let camera = UIAlertAction(title: "Камера",
                                   style: .default) {
                                    (action) in
            self.presenter.imagePicker(.camera)
        }
        
        let urlDownLoad = UIAlertAction(title: "Скачать по url",
                                        style: .default) {
                                            (action) in
            self.presenter.showDownloadAlert()
        }
        
        
        let cancel = UIAlertAction(title: "Отмена",
                                   style: .cancel,
                                   handler: nil)
        
        alert.addAction(photoGallery)
        alert.addAction(camera)
        alert.addAction(urlDownLoad)
        alert.addAction(cancel)
        
        if let alertPad = alert.popoverPresentationController {
            alertPad.sourceView = view
            alertPad.sourceRect = view.frame
        }
        
        return alert
    }
    
    func createImagePicker(_ source: UIImagePickerControllerSourceType) -> UIImagePickerController? {
        let picker = UIImagePickerController()
        let isAvalible = UIImagePickerController.isSourceTypeAvailable(source)
        
        if isAvalible {
            picker.sourceType = source
            picker.delegate = (self as UIImagePickerControllerDelegate & UINavigationControllerDelegate)
            return picker
        }
        
        return nil
    }
}
