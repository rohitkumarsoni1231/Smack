//
//  ChannelVC.swift
//  Smack
//
//  Created by MacBook on 01/11/2021.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    
    }
    

}
