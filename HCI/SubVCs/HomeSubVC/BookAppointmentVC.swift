//
//  BookAppointmentVC.swift
//  HCI
//
//  Created by Ankit on 03/10/20.
//

import UIKit

class BookAppointmentVC: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.isUserInteractionEnabled = false
        navigationController?.navigationBar.tintColor = UIColor.lightGray
    }

}
