//
//  UIButton.swift
//  Net2Call
//
//  Created by Imam on 28/07/24.
//

import Foundation
import UIKit

extension UIView {
    func addGesture(target: Any?, action: Selector) {
        // Add the gesture recognizer
        let gesture = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(gesture)
        self.isUserInteractionEnabled = true
    }
    
    func makeCircular() {
            self.layer.cornerRadius = min(self.frame.size.width, self.frame.size.height) / 2
            self.layer.masksToBounds = true
        }
}
