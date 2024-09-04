//
//  IncomingViewController.swift
//  Net2Call
//
//  Created by Imam on 27/07/24.
//

import UIKit
import Net2CallSDK

class IncomingViewController: BaseViewController {

    @IBOutlet weak var endImageView: UIImageView!
    @IBOutlet weak var acceptImageView: UIImageView!
    @IBOutlet weak var callerIDLabel: UILabel!
    
    override func setupView() {
        callerIDLabel.text = SDKManager.holder.get()?.currentCall()?.remoteAddress?.asStringUriOnly()
        
        acceptImageView.addGesture(target: self, action: #selector(acceptCall))
        endImageView.addGesture(target: self, action: #selector(rejectCall))
    }
    
    override func gotoCall(state: CallState) {
        let callVC = CallViewController()
        callVC.state = state
        callVC.modalPresentationStyle = .fullScreen
        self.present(callVC, animated: true)
    }
    
    @objc func acceptCall() {
        dismiss(animated: false) {
            SDKManager.holder.get()?.acceptCall()
        }
    }
    
    @objc func rejectCall() {
        SDKManager.holder.get()?.terminateCall()
    }
}
