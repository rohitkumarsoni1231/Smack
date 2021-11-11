//
//  ChatVC.swift
//  Smack
//
//  Created by MacBook on 01/11/2021.
//

import UIKit

class ChatVC: UIViewController {
    
    // Outlets

    @IBOutlet weak var menuBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
            
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail { (success) in
                NotificationCenter.default.post(name: NOTIf_USER_DATA_DID_CHANGE, object: nil)
            }
        }
    }
    

  
}
