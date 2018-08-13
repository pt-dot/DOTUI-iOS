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
    
    static func build(_ string: String) -> Typography {
        if string == Typography.headline.rawValue {
            return .headline
        } else if string == Typography.title.rawValue {
            return .title
        } else {
            return .headline
        }
    }
    
}

@IBDesignable
class DOTHeadlineText: UILabel {
    
   
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
    
    override func layoutSubviews() {
        if self.selectedTypography == .headline {
            self.font = UIFont.boldSystemFont(ofSize: 24)
        } else if self.selectedTypography == .title {
            self.font = UIFont.systemFont(ofSize: 20)
            
        }
    }
    
}

