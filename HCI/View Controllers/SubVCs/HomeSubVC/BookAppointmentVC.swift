//
//  BookAppointmentVC.swift
//  HCI
//
//  Created by Ankit on 03/10/20.
//

import UIKit

class BookAppointmentVC: UIViewController {
    
    @IBOutlet weak var cardView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cardView.layer.cornerRadius = 20
    }

}
