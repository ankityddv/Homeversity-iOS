//
//  BookAppointmentVC.swift
//  HCI
//
//  Created by Ankit on 03/10/20.
//  Give me suggestion on twitter @ankityddv (www.twitter.com/ankityddv)

import UIKit

class BookAppointmentVC: UIViewController {
    
    @IBOutlet weak var cardView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardView.layer.cornerRadius = 20
    }

}
