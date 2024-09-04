//
//  DialViewController.swift
//  Net2Call
//
//  Created by Imam on 24/07/24.
//

import UIKit
import Net2CallSDK

class DialViewController: BaseViewController {
    @IBOutlet weak var pad1View: UIView!
    @IBOutlet weak var pad2View: UIView!
    @IBOutlet weak var pad3View: UIView!
    @IBOutlet weak var pad4View: UIView!
    @IBOutlet weak var pad5View: UIView!
    @IBOutlet weak var pad6View: UIView!
    @IBOutlet weak var pad7View: UIView!
    @IBOutlet weak var pad8View: UIView!
    @IBOutlet weak var pad9View: UIView!
    @IBOutlet weak var pad0View: UIView!
    @IBOutlet weak var padAsteriskView: UIView!
    @IBOutlet weak var padHashView: UIView!
    @IBOutlet weak var callImageView: UIImageView!
    @IBOutlet weak var eraseImageView: UIImageView!
    @IBOutlet weak var inputNumberLabel: UILabel!
    @IBOutlet weak var backImageView: UIImageView!
    
    override func setupView() {
        inputNumberLabel.text = "7777"
        padsCircular()
        addGestures()
    }
    
    fileprivate func padsCircular() {
        pad0View.makeCircular()
        pad1View.makeCircular()
        pad2View.makeCircular()
        pad3View.makeCircular()
        pad4View.makeCircular()
        pad5View.makeCircular()
        pad6View.makeCircular()
        pad7View.makeCircular()
        pad8View.makeCircular()
        pad9View.makeCircular()
        padAsteriskView.makeCircular()
        padHashView.makeCircular()
    }
    
    fileprivate func addGestures() {
        pad1View.addGesture(target: self, action: #selector(pad1Tap))
        pad2View.addGesture(target: self, action: #selector(pad2Tap))
        pad3View.addGesture(target: self, action: #selector(pad3Tap))
        pad4View.addGesture(target: self, action: #selector(pad4Tap))
        pad5View.addGesture(target: self, action: #selector(pad5Tap))
        pad6View.addGesture(target: self, action: #selector(pad6Tap))
        pad7View.addGesture(target: self, action: #selector(pad7Tap))
        pad8View.addGesture(target: self, action: #selector(pad8Tap))
        pad9View.addGesture(target: self, action: #selector(pad9Tap))
        pad0View.addGesture(target: self, action: #selector(pad0Tap))
        padAsteriskView.addGesture(target: self, action: #selector(padAsteriskTap))
        padHashView.addGesture(target: self, action: #selector(padHasTap))
        callImageView.addGesture(target: self, action: #selector(callTap))
        eraseImageView.addGesture(target: self, action: #selector(correctionTap))
        backImageView.addGesture(target: self, action: #selector(backTap))
    }
    
    func addInputNumber(input: String) {
        if input == "correction" {
            if let currentText = inputNumberLabel.text, !currentText.isEmpty {
                inputNumberLabel.text = String(currentText.dropLast())
            }
        } else {
            if let currentText = inputNumberLabel.text, currentText.count < 15 {
                inputNumberLabel.text = "\(currentText)\(input)"
            }
        }
    }
    
    @objc func backTap() {
        dismiss(animated: false)
    }
    
    @objc func pad1Tap() {
        addInputNumber(input: "1")
    }
    
    @objc func pad2Tap() {
        addInputNumber(input: "2")
    }
    
    @objc func pad3Tap() {
        addInputNumber(input: "3")
    }
    
    @objc func pad4Tap() {
        addInputNumber(input: "4")
    }
    
    @objc func pad5Tap() {
        addInputNumber(input: "5")
    }
    
    @objc func pad6Tap() {
        addInputNumber(input: "6")
    }
    
    @objc func pad7Tap() {
        addInputNumber(input: "7")
    }
    
    @objc func pad8Tap() {
        addInputNumber(input: "8")
    }
    
    @objc func pad9Tap() {
        addInputNumber(input: "9")
    }
    
    @objc func pad0Tap() {
        addInputNumber(input: "0")
    }
    
    @objc func padAsteriskTap() {
        addInputNumber(input: "*")
    }
    
    @objc func padHasTap() {
        addInputNumber(input: "#")
    }
    
    @objc func correctionTap() {
        addInputNumber(input: "correction")
    }
    
    @objc func callTap() {
        if let number = inputNumberLabel.text {
            SDKManager.holder.get()?.outgoingCall(address: String(format: "sip:%@@cloud.optimaccs.com", number))
        }
    }
}
