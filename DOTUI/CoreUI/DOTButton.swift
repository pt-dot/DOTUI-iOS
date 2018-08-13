//
//  DOTButton.swift
//  DOTUI
//
//  Created by Agus Cahyono on 13/08/18.
//  Copyright © 2018 Agus Cahyono. All rights reserved.
//

import UIKit

@IBDesignable class DOTButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    
    /// Set Corner Radius UIButton
    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
    
    
    /// Set Border Color UIButton
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    
    /// Set Border Width UIButton
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    
    /// Set Image for UIButton
    @IBInspectable var image: UIImage? {
        didSet {
            setImage(image!)
        }
    }
    
    
    /// Set Shadow Height UIButton
    @IBInspectable var shadowHeight: CGFloat = 0 {
        didSet {
            self.addShadow(shadowColor, height: shadowHeight)
        }
    }
    
    
    /// Set Shadow Color UIButton
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
        setImage(image, for: .normal)
        addShadow(shadowColor, height: shadowHeight)
    }
    
    
    /// Set image for button (optional)
    ///
    /// - Parameter image: image icon button
    func setImage(_ image: UIImage) {
        self.setImage(image, for: .normal)
        self.imageView?.contentMode = .scaleAspectFit
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
    }
    
    
    /// Shadow Button
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
