//
//  ComplainRegisteredVC.swift
//  HCI
//
//  Created by Ankit on 24/09/20.
//  Give me suggestion on twitter @ankityddv (www.twitter.com/ankityddv)

import UIKit

class ComplainRegisteredVC: UIViewController {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet weak var displaytxtLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gifImageView.loadGif(name: "fire")
        cardView.layer.cornerRadius = 30
    }

}
