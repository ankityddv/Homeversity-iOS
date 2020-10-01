//
//  ActualGradientButton.swift
//  HCI
//
//  Created by Ankit on 01/10/20.
//

import UIKit
class ActualGradientButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()
        l.frame = self.bounds
        l.colors = [UIColor.systemBlue.cgColor, UIColor.systemPurple.cgColor]
        l.startPoint = CGPoint(x: 0, y: 0.5)
        l.endPoint = CGPoint(x: 1, y: 0.5)
        l.cornerRadius = 20
        layer.insertSublayer(l, at: 0)
        return l
    }()
}
