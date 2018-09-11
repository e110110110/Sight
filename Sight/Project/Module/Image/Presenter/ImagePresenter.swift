//
//  ImagePresenter.swift
//  Sight
//
//  Created by enot on 06.09.2018.
//  Copyright (c) 2018 eno0t. All rights reserved.
//

import Foundation
import UIKit

class ImagePresenter:  ImagePresenterProtocol {
    
    //MARK: Injections
    private weak var viewController: ImageViewControllerProtocol!
    var router: ImageRouterProtocol
    private var model: ImageModelProtocol
    
    //MARK: LifeCycle
    init(output: ImageViewControllerProtocol,
         router: ImageRouterProtocol,
         model:  ImageModelProtocol) {
        
        self.viewController = output
        self.router = router
        self.model = model
    }
    
    //MARK: ImagePresenterInput
    func viewDidLoad() {
        self.model.delegate = self
        viewController.hideAtStart()
    }
    
    func chooseAction(_ view: UIView){
        let alert = viewController.createChooseImage(view: view)
        chooseImage(alert)
    }
    
    func showDownloadAlert(){
        let alert = viewController.createDownloadAlert()
        showDownloadAlert(alert)
    }
    
    func imagePicker(_ source: UIImagePickerControllerSourceType){
        if let imagePicker = viewController.createImagePicker(source){
            showImagePicker(imagePicker)
        }else{
            showError("Разрешите в настройках доступ к камере и галереи")
            //TODO: сделать алерт, который кидает в настройки
            //TODO: сделать текст сообщения об ошибки был контекстным
        }
    }
    
    func imagePickerFinish(_ image: UIImage){
        viewController.setImage(image)
        viewController.showControls()
    }
    
    func rotate() {
        let image = viewController.rotateImage()
    }
    
    func mirrior() {
        let image = viewController.mirriorImage()
    }
    
    func invert() {
        let image = viewController.invertImage()
    }
    
    func showError(_ message: String){
        router.showErrorAlert(message)
    }
    
    func startDownload(url: String) {
        viewController.hideAtLoad()
        model.startLoad(url: url)
    }
    
    private func chooseImage(_ alert: UIAlertController) {
        router.chooseImage(alert)
    }
    
    private func showDownloadAlert(_ alert: UIAlertController){
        router.showDownloadAlert(alert)
    }
    
    private func showImagePicker(_ imagePicker: UIImagePickerController){
        router.showImagePicker(imagePicker)
    }
}

extension ImagePresenter: ImageModelDelegate {
    func downloadProgressUpdate(for progress: Float) {
        viewController.setProgress(progress)
    }
    
    func image(_ image: UIImage) {
        viewController.setImage(image)
        viewController.showControls()
    }
}
