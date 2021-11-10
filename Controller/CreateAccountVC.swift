//
//  CreateAccountVC.swift
//  Smack
//
//  Created by MacBook on 02/11/2021.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func createAccntPressed(_ sender: Any) {
        guard let email = emailTxt.text , emailTxt.text != "" else { return }
        guard let pass = passTxt.text , passTxt.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: pass)
        { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: pass, completion: {
                    (success) in
                    if success {
                        print("logged in User", AuthService.instance.authToken)
                    }
                })
            }
        }
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
        
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
    }
    
    @IBAction func closedBtnPressed(_ sender: Any) {
        
    performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
}
