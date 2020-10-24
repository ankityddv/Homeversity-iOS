//
//  OnboardingVC.swift
//  HCI
//
//  Created by Ankit on 15/10/20.
//  Give me suggestion on twitter @ankityddv (www.twitter.com/ankityddv)

import UIKit

class OnboardingVC: UIViewController {

    @IBAction func continueBttnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isModalInPresentation = true
    }
}
