//
//  DOTTextField.swift
//  DOTUI
//
//  Created by Agus Cahyono on 13/08/18.
//  Copyright © 2018 Agus Cahyono. All rights reserved.
//

import UIKit

@IBDesignable
class DOTTextField: UITextField {
    
    var padding = UIEdgeInsets()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setBottomLine(borderColor: self.bottomLineColor)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @IBInspectable var isbordered: Bool = false {
        didSet {
            if isbordered {
                padding = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
            } else {
                padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            }
        }
    }
    
    @IBInspectable var bottomLineColor: UIColor = UIColor.clear {
        didSet {
            self.setBottomLine(borderColor: bottomLineColor)
        }
    }
    
    /// Set Border Color UIView
    @IBInspectable var borderColor: UIColor? {
        didSet {
            self.layer.borderColor = borderColor?.cgColor
        }
    }
    
    
    /// Set Border Width UIView
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    func setBottomLine(borderColor: UIColor) {
        
        self.borderStyle = UITextBorderStyle.none
        self.backgroundColor = UIColor.clear
        let borderLine = UIView()
        let height = 1.0
        borderLine.frame = CGRect(x: 0, y: Double(self.frame.height) - height, width: Double(self.frame.width), height: height)
        borderLine.backgroundColor = borderColor
        self.addSubview(borderLine)
    }
    
    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
    
}
