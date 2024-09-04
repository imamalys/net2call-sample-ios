//
//  BaseViewController.swift
//  Net2Call
//
//  Created by Imam on 28/07/24.
//

import Foundation
import UIKit
import Net2CallSDK

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        // Accessing the AppDelegate variable
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        SDKManager.holder.get()?.delegate = self
        // Accessing the AppDelegate variable
        if SDKManager.holder.get()?.currentCall() == nil {
            dismissView()
        }
    }
    
    internal func setupView() {}
    
    internal func onConnect() {}
    
    internal func dismissView() {}
    
    internal func releaseCall() {
        dismiss(animated: false)
    }
    
    internal func gotoCall(state: CallState) {
        let callVC = CallViewController()
        callVC.state = state
        callVC.modalPresentationStyle = .fullScreen
        self.present(callVC, animated: true)
    }
    
    internal func gotoIncomingCall() {
        let callVC = IncomingViewController()
        callVC.modalPresentationStyle = .fullScreen
        self.present(callVC, animated: true)
    }
}

extension BaseViewController: SDKDelegate {
    func onConnectSuccess() {
        onConnect()
    }
    
    func onCallStateChanged(state: CallState) {
        switch state {
        case .IncomingReceived:
            gotoIncomingCall()
        case .OutgoingProgress, .Connected:
            gotoCall(state: state)
        case .Released:
            releaseCall()
        default:
            break
        }
    }
}
