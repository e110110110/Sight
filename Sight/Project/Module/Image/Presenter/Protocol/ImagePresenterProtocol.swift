//
//  ImagePresenterProtocol.swift
//  Sight
//
//  Created by enot on 08.09.2018.
//  Copyright © 2018 eno0t. All rights reserved.
//

import Foundation
import UIKit

protocol ImagePresenterProtocol {
    var router: ImageRouterProtocol { get }
    func viewDidLoad()
    
    func startDownload(url: String)
    
    func showDownloadAlert()
    func chooseAction(_ view: UIView)
    
    func imagePicker(_ source: UIImagePickerControllerSourceType)
    func imagePickerFinish(_ image: UIImage)
    
    func showError(_ message: String)
    
    func invert()
    func mirrior()
    func rotate()
}
