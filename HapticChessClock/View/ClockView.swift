//
//  ClockView.swift
//  HapticChessClock
//
//  Created by Yoon Shin on 2/18/19.
//  Copyright © 2019 Yoon Shin. All rights reserved.
//

import UIKit


protocol ClockViewDelegate: class {
    func toggled(clockView: ClockView)
}

class ClockView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var clockButton: UIButton!

    weak var delegate: ClockViewDelegate?
    let animationTime: Double = 0.08

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    private func commonInit() {
        let nib = UINib(nibName: "ClockView", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        self.addSubview(view)

        self.clockButton.titleLabel?.isHighlighted = false
        self.clockButton.titleLabel?.highlightedTextColor = .white
        self.clockButton.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        self.enable()
    }

    override func layoutSubviews() {
        self.contentView.frame = self.bounds
        self.clockButton.backgroundColor = UIColor.HCCGreen

        let cornerRadius = self.clockButton.bounds.height/2
        self.clockButton.layer.cornerRadius = cornerRadius
        self.clockButton.clipsToBounds = true
    }
    
    @objc func tapped() {
        self.delegate?.toggled(clockView: self)
    }

    func updateTime(_ timeString: String) {
        self.clockButton.setTitle(timeString, for: .normal)
        self.clockButton.titleLabel?.sizeToFit()
    }

    func enable() {
        self.clockButton.isEnabled = true
        UIView.animate(withDuration: self.animationTime) {
            self.clockButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.clockButton.backgroundColor = UIColor.HCCGreen
        }
        UIView.transition(with: self.clockButton.titleLabel!, duration: self.animationTime, options: .transitionCrossDissolve, animations: {
            self.clockButton.setTitleColor(.white, for: .normal)
        }, completion: nil)

    }

    func disable() {
        self.clockButton.isEnabled = false
        UIView.animate(withDuration: self.animationTime) {
            self.clockButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            self.clockButton.backgroundColor = UIColor.HCCDarkGreen
        }
        UIView.transition(with: self.clockButton.titleLabel!, duration: self.animationTime, options: .transitionCrossDissolve, animations: {
            self.clockButton.setTitleColor(.lightGray, for: .normal)
        }, completion: nil)
    }

    func timeover() {
        self.clockButton.isEnabled = false
        UIView.animate(withDuration: self.animationTime) {
            self.clockButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            self.clockButton.backgroundColor = UIColor.red
        }
        UIView.transition(with: self.clockButton.titleLabel!, duration: self.animationTime, options: .transitionCrossDissolve, animations: {
            self.clockButton.setTitleColor(.lightGray, for: .normal)
        }, completion: nil)
    }
}


