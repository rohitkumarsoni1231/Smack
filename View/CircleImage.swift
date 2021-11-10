//
//  CircleImage.swift
//  Smack
//
//  Created by MacBook on 10/11/2021.
//

import UIKit

class CircleImage: UIImageView {

    override func awakeFromNib() {
        setupView()
    }
    
    func setupView()
    {
        self.layer.cornerRadius = self.frame.width/2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
}
