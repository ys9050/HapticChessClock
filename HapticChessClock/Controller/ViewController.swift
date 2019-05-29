//
//  ViewController.swift
//  HapticChessClock
//
//  Created by Yoon Shin on 2/18/19.
//  Copyright © 2019 Yoon Shin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var topClockView: ClockView!
    @IBOutlet weak var botClockView: ClockView!
    @IBOutlet weak var tableviewButton: UIButton!

    var topClock: ClockController?
    var botClock: ClockController?

    override func viewDidLoad() {
        super.viewDidLoad()

        topClock = ClockController(clockView: topClockView)
        botClock = ClockController(clockView: botClockView)

        topClock?.delegate = self
        botClock?.delegate = self

        self.view.backgroundColor = UIColor.black
        print("TEst")
    }

    override func viewDidLayoutSubviews() {
        // Flip the top clock upside down
        self.topClockView.transform = CGAffineTransform(rotationAngle: (180.0 * .pi) / 180.0)
        super.viewDidLayoutSubviews()
        NSLog("test")
    }
}

extension ViewController: ClockControllerDelegate {
    func toggled(clockController: ClockController, isClockEnabled: Bool) {
        let activeClock = clockController
        let inactiveClock = clockController === topClockView
            ? botClock : topClock

        print("ViewContrller ClockControllerDelegate Toggled")

        activeClock.enableButton()
        inactiveClock?.disableButton()
    }
}

//extension ViewController {
//    func isEnabled(clock: ClockController, isButtonEnabled: Bool) {
//
//        let inactiveClock = clock === self.topClock
//            ? self.botClock : self.topClock
//        inactiveClockView?.isButtonEnabled = !isButtonEnabled
//        activeTimer.timer?.invalidate()
//        inactiveTimer.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { _ in
//            if inactiveTimer.time > 0 {
//                inactiveTimer.changeTime(cSeconds: inactiveTimer.time - 1)
//                inactiveClockView?.updateTime(inactiveTimer.timeString())
//            } else if inactiveTimer.time == 0 {
//                inactiveClockView?.timeoverButton()
//                inactiveTimer.timer?.invalidate()
//            }
//        })
//        inactiveClockView?.resetButton()
//    }
//}

