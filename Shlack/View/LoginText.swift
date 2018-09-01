//
//  LoginText.swift
//  Shlack
//
//  Created by Marko R. on 7/4/18.
//  Copyright © 2018 Marko. All rights reserved.
//

import UIKit

@IBDesignable

class LoginText: UITextField {
        

        
        override func prepareForInterfaceBuilder() {
            customizeView()
        }
    
        // used to update story board
        override func awakeFromNib() {
            super.awakeFromNib()
            customizeView()
        }
        
        func customizeView() {
            backgroundColor = #colorLiteral(red: 0.558916986, green: 0.6614583135, blue: 0.7653874755, alpha: 0.2494916524)
            layer.cornerRadius = 5.0
            textAlignment = .left
            clipsToBounds = true
            
            
            
            if let p = placeholder {
                let place = NSAttributedString(string: p, attributes: [.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)])
                attributedPlaceholder = place
                textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
            
            
        }
        
}
