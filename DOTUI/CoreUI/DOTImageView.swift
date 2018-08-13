//
//  DOTImageView.swift
//  DOTUI
//
//  Created by Agus Cahyono on 13/08/18.
//  Copyright © 2018 Agus Cahyono. All rights reserved.
//

import UIKit

@IBDesignable
class DOTImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.sharedInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.refreshCorners(value: self.cornerRadius)
        self.setEllipseRounded()
    }
    
    /// Set Corner Radius UIImageView
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.refreshCorners(value: cornerRadius)
        }
    }
    
    @IBInspectable var ellipseRounded: Bool = false {
        didSet {
            self.setEllipseRounded()
        }
    }
    
    
    /// Set Border Color UIImageView
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    
    /// Set Border Width UIImageView
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        self.sharedInit()
    }
    
    func sharedInit() {
        self.refreshCorners(value: cornerRadius)
    }
    
    func refreshCorners(value: CGFloat) {
        self.layer.cornerRadius = value
        self.layer.masksToBounds = true
    }
    
    func setEllipseRounded() {
        if ellipseRounded {
            self.layer.cornerRadius = self.frame.size.width / 2
            self.layer.masksToBounds =  true
            self.clipsToBounds = true
        } else {
            self.layer.masksToBounds =  true
            self.clipsToBounds = true
        }
    }
    
}
