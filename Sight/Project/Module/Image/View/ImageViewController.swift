//
//  ImageViewController.swift
//  Sight
//
//  Created by enot on 06.09.2018.
//  Copyright (c) 2018 eno0t. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var chooseImage: UIImageView!
    @IBOutlet weak var chooseButton: DSButton!
    @IBOutlet weak var chooseProgress: UIProgressView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var rotateButton: DSButton!
    @IBOutlet weak var mirrorButton: DSButton!
    @IBOutlet weak var blackInvertButton: DSButton!
    
    // MARK: Injections
    var presenter: ImagePresenterProtocol!

    // MARK: View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    @IBAction func chooseAction(_ sender: Any) {
        presenter.chooseAction(sender as! UIView)
    }
    
    @IBAction func chooseGesture(_ sender: UITapGestureRecognizer) {
        presenter.chooseAction(chooseImage)
    }
    
    @IBAction func rotateAction(_ sender: DSButton) {
        presenter.rotate()
    }
    
    @IBAction func mirriorAction(_ sender: DSButton) {
        presenter.mirrior()
    }
    
    @IBAction func blackInvertAction(_ sender: DSButton) {
        presenter.invert()
    }
    
    func hideAtStart() {
        DispatchQueue.main.async {
            self.chooseImage.isHidden = true
            self.chooseProgress.isHidden = true
            self.stackView.isHidden = true
        }
    }
    
    func hideAtLoad() {
        DispatchQueue.main.async {
            self.stackView.isHidden = true
            self.chooseImage.isHidden = true
            self.chooseButton.isHidden = true
            self.chooseProgress.isHidden = false
            
            self.chooseProgress.progress = 0.0
        }
    }
    
    func showControls() {
        DispatchQueue.main.async {
            self.stackView.isHidden = false
            self.chooseImage.isHidden = false
            self.chooseButton.isHidden = true
            self.chooseProgress.isHidden = true
        }
    }
    
    func setImage(_ image: UIImage) {
        DispatchQueue.main.async {
            self.chooseImage.image = image
            self.chooseProgress.isHidden = true
        }
    }
    
    func setProgress(_ progress: Float) {
        DispatchQueue.main.async {
            self.chooseProgress.progress = progress
            self.chooseProgress.isHidden = false
        }
    }
    
    func mirriorImage() -> UIImage {
        self.chooseImage.mirrior()
        return self.chooseImage.image!
    }
    
    func rotateImage() -> UIImage {
        self.chooseImage.rotate()
        return self.chooseImage.image!
    }
    
    func invertImage() -> UIImage {
        self.chooseImage.monoEffect()
        return self.chooseImage.image!
    }
}

extension ImageViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        let pickerImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        presenter.imagePickerFinish(pickerImage)
        picker.dismiss(animated: true, completion: nil)
    }
}

extension ImageViewController: UINavigationControllerDelegate {
    
}
