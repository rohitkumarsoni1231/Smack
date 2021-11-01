//
//  ChannelVC.swift
//  Smack
//
//  Created by MacBook on 01/11/2021.
//

import UIKit

class ChannelVC: UIViewController {

    //Outlets
    
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width -   60
    
    }
    
    
    @IBAction func loginBtnPressed(_ sender: Any) {
    
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
}
