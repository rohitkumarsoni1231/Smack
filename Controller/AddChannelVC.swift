//
//  AddChannelVC.swift
//  Smack
//
//  Created by MacBook on 12/11/2021.
//

import UIKit

class AddChannelVC: UIViewController {

    //Outlets
    
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var channelDescriptionTxt: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    @IBAction func createChannelPressed(_ sender: Any) {
        guard let channelName = nameTxt.text , nameTxt.text != "" else { return }
        guard let channnelDesc = channelDescriptionTxt.text else { return }
        SocketService.instance.addChannel(channelName: channelName, channelDescription: channnelDesc) { success, errorMessage in
            if success {
                self.dismiss(animated: true, completion: nil)
            } else {
                print(errorMessage)
            }
        }
    }
    
    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        nameTxt.attributedPlaceholder = NSAttributedString(string: "name", attributes:
                                                            [NSAttributedString.Key.foregroundColor : smackPurplePlaceHolder])
        channelDescriptionTxt.attributedPlaceholder = NSAttributedString(string: "Description", attributes:
                                                                            [NSAttributedString.Key.foregroundColor : smackPurplePlaceHolder])
    }
    
    @objc func closeTap(_ recongnizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }

}
