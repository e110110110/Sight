//
//  ImageModelble.swift
//  Sight
//
//  Created by enot on 06.09.2018.
//  Copyright © 2018 eno0t. All rights reserved.
//

import Foundation

protocol ImageModelProtocol {
    
    var delegate: ImageModelDelegate? { get set }
    
    func startLoad(url: String)
    
}
