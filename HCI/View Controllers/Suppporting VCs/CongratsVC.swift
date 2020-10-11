//
//  CongratsVC.swift
//  HCI
//
//  Created by Ankit on 11/09/20.
//  Give me suggestion on twitter @ankityddv (www.twitter.com/ankityddv)

import UIKit

class CongratsVC: UIViewController {
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var continueBttn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // To load a GIF
        imageV.loadGif(name: "fire")
        continueBttn.layer.cornerRadius = 13
    }

}
