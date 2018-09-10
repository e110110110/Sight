//
//  ImageTableViewCell.swift
//  Sight
//
//  Created by enot on 08.09.2018.
//  Copyright (c) 2018 eno0t. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var resultImage: UIImageView!
    
    // MARK: Injections
    var presenter: ImageTableViewCellPresenterInput!
    var configurator: ImageCellAssamblyProtocol!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        configurator = ImageCellAssambly()
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

// MARK: - ImageCellPresenterOutput
extension ImageTableViewCell: ImageTableViewCellPresenterOutput {

}
