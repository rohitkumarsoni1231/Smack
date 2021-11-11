//
//  ProfileVC.swift
//  Smack
//
//  Created by MacBook on 11/11/2021.
//

import UIKit

class ProfileVC: UIViewController {

//Outlets
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var userEmail: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    
    @IBAction func closeModelPressed(_ sender: Any) {
       dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIf_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    func setupView(){
        userName.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        profileImg.image = UIImage(named:  UserDataService.instance.avatarName)
        profileImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap(_:)))
        
        bgView.addGestureRecognizer(closeTouch)
    
    }
    
    @objc func closeTap(_ recoginzer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
        
    }
    
}
