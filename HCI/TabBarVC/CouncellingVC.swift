//
//  CouncellingVC.swift
//  HCI
//
//  Created by Ankit on 20/09/20.
//

import UIKit

class CouncellingVC: UIViewController {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var proceedBttn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        cardView.layer.cornerRadius = 10
        proceedBttn.layer.cornerRadius = 13
    }

}
