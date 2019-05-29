//
//  HCCTimer.swift
//  HapticChessClock
//
//  Created by Yoon Shin on 2/18/19.
//  Copyright © 2019 Yoon Shin. All rights reserved.
//

import Foundation

protocol HCCTimerDelegate: class {
    func updateTime()
}

class HCCTimer {

    // in hundredth of a second
    var time: UInt = 12_0000
    var timer: Timer?

    weak var delegate: HCCTimerDelegate?

    func changeTime(cSeconds: UInt) {
        if time >= 0 {
        time = cSeconds
        }
    }

    func incrementTime(seconds: UInt) {
        self.time += seconds * 100
    }

    func timeString() -> String {
        let hours = self.time / 3600_00
        let minutes = self.time / 60_00 % 60
        let seconds = (self.time / 1_00) % 60
        print(seconds)
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)

    }
}


