//
//  ImageRoutable.swift
//  Sight
//
//  Created by enot on 06.09.2018.
//  Copyright © 2018 eno0t. All rights reserved.
//

import Foundation
import UIKit

protocol ImageRouterProtocol {
    func chooseImage(_ alert: UIAlertController)
    func showDownloadAlert(_ alert: UIAlertController)
    func showImagePicker(_ imagePicker: UIImagePickerController)
    
    func showErrorAlert(_ message: String)
}
