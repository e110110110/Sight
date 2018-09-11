//
//  ImageViewControllerExtension.swift
//  Sight
//
//  Created by enot on 08.09.2018.
//  Copyright © 2018 eno0t. All rights reserved.
//

import Foundation
import UIKit

let cellImageIdentifier = "image"

extension ImageViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ImageCellAssambly().configure(tableView: tableView,
                                                 indexPath: indexPath,
                                                 image: Image())
        
        return cell
    }
    
    
}


extension ImageViewController : UITableViewDelegate {
    
}
