//
//  UIImageExtension.swift
//  Sight
//
//  Created by enot on 06.09.2018.
//  Copyright © 2018 eno0t. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func rotate() {
        self.transform = self.transform.rotated(by: CGFloat(Double.pi / -2))
    }
    
    func mirrior() {
        if #available(iOS 10.0, *) {
            self.image = self.image?.withHorizontallyFlippedOrientation()
        } else {
            self.transform = self.transform.scaledBy(x: -1, y: 1)
        }
    }
    
    func monoEffect() {
        let context = CIContext(options: nil)
        
        let currentFilter = CIFilter(name: "CIPhotoEffectNoir")
        currentFilter!.setValue(CIImage(image: self.image!), forKey: kCIInputImageKey)
        let output = currentFilter!.outputImage
        let cgimg = context.createCGImage(output!,from: output!.extent)
        let processedImage = UIImage(cgImage: cgimg!)
        self.image = processedImage
    }
}
