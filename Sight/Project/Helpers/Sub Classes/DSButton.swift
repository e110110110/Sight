//
//  DSButton.swift
//  Sight
//
//  Created by enot on 07.09.2018.
//  Copyright © 2018 eno0t. All rights reserved.
//

import UIKit

@IBDesignable
open class DSButton: UIButton {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setTitle("MyTitle", for: .normal)
        setTitleColor(UIColor.blue, for: .normal)
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBInspectable
    public var cornerRadius: CGFloat = 2.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    
    @IBInspectable
    public var shadowColor: UIColor = UIColor.black {
        didSet {
            self.layer.shadowColor = self.shadowColor.cgColor
        }
    }
    
    @IBInspectable
    public var shadowOffset: CGSize = CGSize(width: 5, height: 5) {
        didSet {
            self.layer.shadowOffset = self.shadowOffset
        }
    }
    
    @IBInspectable
    public var shadowRadius: CGFloat = 5 {
        didSet {
            self.layer.shadowRadius = self.shadowRadius
        }
    }
    
    @IBInspectable
    public var shadowOpacity: Float = 1.0 {
        didSet {
            self.layer.shadowOpacity = self.shadowOpacity
        }
    }
    
}
