//
//  DOTHeadlineText.swift
//  DOTUI
//
//  Created by Agus Cahyono on 13/08/18.
//  Copyright © 2018 Agus Cahyono. All rights reserved.
//

import UIKit

enum Typography: String {
    case headline   = "headline"
    case title      = "title"
    case subheader  = "subheader"
    case bodybold   = "bodybold"
    case body       = "body"
    case caption    = "caption"
    
    static func build(_ string: String) -> Typography {
        if string == Typography.headline.rawValue {
            return .headline
        } else if string == Typography.title.rawValue {
            return .title
        } else if string == Typography.subheader.rawValue {
            return .subheader
        } else if string == Typography.bodybold.rawValue {
            return .bodybold
        } else if string == Typography.body.rawValue {
            return .body
        } else if string == Typography.caption.rawValue {
            return .caption
        } else {
            return .headline
        }
    }
    
}

@IBDesignable
class DOTHeadlineText: UILabel {
   
    let fontName = "Roboto-Regular"
    let fontBoldName = "Roboto-Medium"
   
    var selectedTypography = Typography.headline
    
    @IBInspectable var headlineColor: UIColor? {
        didSet {
            self.textColor = headlineColor
        }
    }
    
    @IBInspectable var typography: String = "" {
        didSet {
            self.selectedTypography = Typography.build(typography)
        }
    }
    
    @IBInspectable var typographyType = UIKeyboardType.default.rawValue {
        didSet {
//            self.selectedTypography = Typography.build(typographyType)
        }
    }
    
    override func layoutSubviews() {
        if self.selectedTypography == .headline {
            self.font = UIFont(name: fontName, size: 24)
        } else if self.selectedTypography == .title {
            self.font = UIFont(name: fontBoldName, size: 20)
        } else if self.selectedTypography == .subheader {
            self.font = UIFont(name: fontName, size: 16)
        } else if self.selectedTypography == .bodybold {
            self.font = UIFont(name: fontBoldName, size: 14)
        } else if self.selectedTypography == .body {
            self.font = UIFont(name: fontName, size: 14)
        } else if self.selectedTypography == .caption {
            self.font = UIFont(name: fontName, size: 12)
        }
    }
    
}

