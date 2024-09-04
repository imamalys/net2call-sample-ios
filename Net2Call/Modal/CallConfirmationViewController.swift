//
//  CallConfirmationViewController.swift
//  Net2Call
//
//  Created by Imam on 02/09/24.
//

import UIKit

protocol CallConfirmationDelegate {
    func onConfirm()
}
class CallConfirmationViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    var delegate: CallConfirmationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func confirmTap(_ sender: Any) {
        dismiss(animated: false) {
            self.delegate?.onConfirm()
        }
    }
    
    @IBAction func cancelTap(_ sender: Any) {
        dismiss(animated: false)
    }
    
    static func showPopup(parentVC: UIViewController){
        //creating a reference for the dialogView controller
        let popupViewController = CallConfirmationViewController(nibName: "CallConfirmationViewController", bundle: nil)
        popupViewController.modalPresentationStyle = .custom
        popupViewController.modalTransitionStyle = .crossDissolve
        //setting the delegate of the dialog box to the parent viewController
        popupViewController.delegate = parentVC as? CallConfirmationDelegate
        //presenting the pop up viewController from the parent viewController
        parentVC.present(popupViewController, animated: true)
    }
}
