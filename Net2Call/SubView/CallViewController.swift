//
//  OutgoingViewController.swift
//  Net2Call
//
//  Created by Imam on 23/07/24.
//

import UIKit
import Net2CallSDK

class CallViewController: BaseViewController {
    @IBOutlet weak var dialActiveImageView: UIImageView!
    @IBOutlet weak var speakerIcon: UIImageView!
    @IBOutlet weak var endCallImageView: UIImageView!
    @IBOutlet weak var callInfoView: UIStackView!
    @IBOutlet weak var callStateLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var durationView: UIView!
    @IBOutlet weak var callHoldLabel: UILabel!
    @IBOutlet weak var micImageView: UIImageView!
    @IBOutlet weak var pauseImageView: UIImageView!
    @IBOutlet weak var durationLabel: UILabel!
    
    var state: CallState?
    var speakerActive = false
    var isMicActive = true
    var isPause = false
    
    override func setupView() {
        endCallImageView.addGesture(target: self, action: #selector(endCall))
        dialActiveImageView.addGesture(target: self, action: #selector(dialTap))
        speakerIcon.addGesture(target: self, action: #selector(toogleSpeaker))
        micImageView.addGesture(target: self, action: #selector(micTap))
        pauseImageView.addGesture(target: self, action: #selector(pauseTap))
        gotoCall(state: state!)
    }
    
    override func dismissView() {
        dismiss(animated: false)
    }
    
    override func gotoCall(state: CallState) {
        self.state = state
        addressLabel.text = SDKManager.holder.get()?.currentCall()?.remoteAddress?.asStringUriOnly()
        switch self.state {
        case .OutgoingProgress:
            callStateLabel.isHidden = false
            durationView.isHidden = true
            callStateLabel.text = "Outgoing Call"
        case .Connected:
            callStateLabel.isHidden = true
            durationView.isHidden = false
            pauseImageView.isHidden = false
            callHoldLabel.isHidden = true
            SDKManager.holder.get()?.setDuration(durationView: durationLabel)
        case .Paused:
            callHoldLabel.isHidden = false
        default:
            break
        }
    }
    
    @objc func toogleSpeaker() {
        if speakerActive {
            speakerIcon.image = UIImage(named: "speaker_icon")?.withTintColor(UIColor(hex: "#102C5D"))
            SDKManager.holder.get()?.setAudioDevices(deviceType: .Earpiece)
        } else {
            speakerIcon.image = UIImage(named: "speaker_off_icon")?.withTintColor(UIColor(hex: "#102C5D"))
            SDKManager.holder.get()?.setAudioDevices(deviceType: .Microphone)
        }
        speakerActive = !speakerActive
    }
    
    @objc func endCall() {
        SDKManager.holder.get()?.terminateCall()
    }
    
    @objc func dialTap() {
        let dtmfVC = DTMFViewController()
        dtmfVC.modalPresentationStyle = .fullScreen
        self.present(dtmfVC, animated: true)
    }
    
    @objc func micTap() {
        isMicActive = !isMicActive
        
        if isMicActive {
            micImageView.image = UIImage(named: "mute_icon")
        } else {
            micImageView.image = UIImage(named: "microphone_icon")
        }
        
        SDKManager.holder.get()?.setMicEnabled(isEnabled: isMicActive)
    }
    
    @objc func pauseTap() {
        isPause = !isPause
        
        if isPause {
            pauseImageView.image = UIImage(named: "resume_icon")
        } else {
            pauseImageView.image = UIImage(named: "pause_icon")
        }
        
        SDKManager.holder.get()?.pauseOrResume()
    }
}
