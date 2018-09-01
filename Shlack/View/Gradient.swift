//
//  Gradient.swift
//  Shlack
//
//  Created by Marko R. on 7/1/18.
//  Copyright © 2018 Marko. All rights reserved.
//

import UIKit

@IBDesignable

class Gradient: UIView {

    @IBInspectable var colorTop: UIColor = #colorLiteral(red: 0.4136648774, green: 0.4841963053, blue: 0.5587561727, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var colorMiddle: UIColor = #colorLiteral(red: 0.3324329257, green: 0.3933498859, blue: 0.4551714659, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var colorBottom: UIColor = #colorLiteral(red: 0.1977140307, green: 0.2338830233, blue: 0.2706575096, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorMiddle.cgColor, colorBottom.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }

}
