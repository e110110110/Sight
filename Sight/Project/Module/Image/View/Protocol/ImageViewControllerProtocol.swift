//
//  ImageViewControllerProtocol.swift
//  Sight
//
//  Created by enot on 08.09.2018.
//  Copyright © 2018 eno0t. All rights reserved.
//

import Foundation
import UIKit

protocol ImageViewControllerProtocol: class {
    func createDownloadAlert() -> UIAlertController
    func createChooseImage(view: UIView) -> UIAlertController
    func createImagePicker(_ source: UIImagePickerControllerSourceType) -> UIImagePickerController?
    
    
    func hideAtStart()
    func hideAtLoad()
    func showControls()
    
    func setImage(_ image: UIImage)
    func setProgress(_ progress: Float)
    
    func rotateImage() -> UIImage
    func invertImage() -> UIImage
    func mirriorImage() -> UIImage
}
