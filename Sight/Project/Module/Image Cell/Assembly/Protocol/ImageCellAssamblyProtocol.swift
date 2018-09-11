//
//  ImageCellAssamblyProtocol.swift
//  Sight
//
//  Created by enot on 08.09.2018.
//  Copyright © 2018 eno0t. All rights reserved.
//

import Foundation
import UIKit

protocol ImageCellAssamblyProtocol {
    func configure(tableView: UITableView,
                   indexPath: IndexPath,
                   image: Image) -> ImageTableViewCell
}
