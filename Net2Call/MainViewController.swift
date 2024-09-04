//
//  ViewController.swift
//  Net2Call
//
//  Created by Imam on 23/07/24.
//

import UIKit
import Net2CallSDK

class MainViewController: BaseViewController, CallConfirmationDelegate {
    func onConfirm() {
        if SDKManager.holder.get()?.loggedIn ?? false {
            SDKManager.holder.get()?.outgoingCall(address: String(format: "sip:%@@cloud.optimaccs.com", "7777"))
        }
    }
    
    @IBOutlet weak var callImageView: UIImageView!
    @IBOutlet weak var dialImageView: UIImageView!
    
    var isRetryCall = false
    
    override func setupView() {
        dialImageView.addGesture(target: self, action: #selector(dialTap))
        callImageView.addGesture(target: self, action: #selector(callTap))
    }
    
    @objc func dialTap() {
        let vc: DialViewController = DialViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @objc func callTap() {
        CallConfirmationViewController.showPopup(parentVC: self)
    }
    
    override func onConnect() {
        if (isRetryCall) {
            isRetryCall = false
            callTap()
        }
    }
}
