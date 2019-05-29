//
//  ClockController.swift
//  HapticChessClock
//
//  Created by Yoon Shin on 5/26/19.
//  Copyright © 2019 Yoon Shin. All rights reserved.
//

import UIKit

protocol ClockControllerDelegate: class {
    func toggled(clockController: ClockController, isClockEnabled: Bool)
}

class ClockController {

    let clockView: ClockView
    let timer = HCCTimer()
    let generator = UIImpactFeedbackGenerator(style: .heavy)

    var isClockEnabled: Bool = true 
    var delegate: ClockControllerDelegate?


    init(clockView: ClockView) {
        self.clockView = clockView
        self.clockView.delegate = self
    }


    func enableButton() {
        clockView.enable()
    }

    func disableButton() {
        clockView.disable()
    }

}

extension ClockController: ClockViewDelegate {
    func toggled(clockView: ClockView) {
        delegate?.toggled(clockController: self, isClockEnabled: isClockEnabled)
    }
}
