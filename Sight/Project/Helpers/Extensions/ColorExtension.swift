//
//  ColorExtension.swift
//  Sight
//
//  Created by enot on 07.09.2018.
//  Copyright © 2018 eno0t. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static let background = UIColor(hex: 0x77B3D4)
    static let button = UIColor(hex: 0x75C2AF)
    static let dark = UIColor(hex: 0x4F5D73)
    static let shadow = UIColor(hex: 0x6695AF)
    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hex:Int) {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff)
    }
    
}
