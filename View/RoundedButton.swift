//
//  RoundedButton.swift
//  Smack
//
//  Created by MacBook on 09/11/2021.
//

import UIKit

class RoundedButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }

    func setupView() {
        self.layer.cornerRadius = cornerRadius
    }
}
