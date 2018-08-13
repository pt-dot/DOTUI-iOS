//
//  DOTView.swift
//  DOTUI
//
//  Created by Agus Cahyono on 13/08/18.
//  Copyright © 2018 Agus Cahyono. All rights reserved.
//

import UIKit

@IBDesignable
class DOTView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    
    /// Set Corner Radius UIView
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
    
    
    /// Set Border Color UIView
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    
    /// Set Border Width UIView
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    /// Set Shadow Height UIView
    @IBInspectable var shadowHeight: CGFloat = 0 {
        didSet {
            self.addShadow(shadowColor, height: shadowHeight)
        }
    }
    
    
    /// Set Shadow Color UIView
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        didSet {
            self.addShadow(shadowColor, height: shadowHeight)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        refreshCorners(value: cornerRadius)
        addShadow(shadowColor, height: shadowHeight)
    }
    
    
    /// Shadow UIView
    ///
    /// - Parameters:
    ///   - color: shadow color
    ///   - height: height shadow
    func addShadow(_ color: UIColor, height: CGFloat = 5.0) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: height)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 5.0
        self.layer.masksToBounds = false
    }
    
    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
    
}
