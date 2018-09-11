//
//  ImageCellConfigurator.swift
//  Sight
//
//  Created by enot on 08.09.2018.
//  Copyright (c) 2018 eno0t. All rights reserved.
//

import UIKit

class ImageCellAssambly: ImageCellAssamblyProtocol {
    private let cellImageIdentifier = "image"
    
    //MARK: ImageCellConfigurable
    func configure(tableView: UITableView,
                   indexPath: IndexPath,
                   image: Image) -> ImageTableViewCell {
        
        //        a - нужно время которое запускает преобразование
        //        б - нужно передавать картинку, чтобы после истечении срока
        //        показывать её
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellImageIdentifier,
                                                 for: indexPath) as! ImageTableViewCell
    
        let router = ImageCellRouter(viewController: cell)
        
        let presenter = ImageTableViewCellPresenter(
            output: cell,
            router: router
        )
        
        cell.presenter = presenter
        
        return cell
    }
}
