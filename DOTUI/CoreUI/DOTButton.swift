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
    
    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
    
    @IBInspectable var image: UIImage? {
        didSet {
            setImage(image!)
        }
    }
    
    @IBInspectable var shadowHeight: CGFloat = 0 {
        didSet {
            self.addShadow(shadowColor, height: shadowHeight)
        }
    }
    
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
    
    func setImage(_ image: UIImage) {
        self.setImage(image, for: .normal)
        self.imageView?.contentMode = .scaleAspectFit
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
    }
    
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
