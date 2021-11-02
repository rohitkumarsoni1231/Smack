//
//  CreateAccountVC.swift
//  Smack
//
//  Created by MacBook on 02/11/2021.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func closedBtnPressed(_ sender: Any) {
        
    performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
}
