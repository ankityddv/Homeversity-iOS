//
//  ComplainRegisteredVC.swift
//  HCI
//
//  Created by Ankit on 24/09/20.
//

import UIKit

class ComplainRegisteredVC: UIViewController {
    @IBOutlet weak var gifImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gifImageView.loadGif(name: "fire")
        // Do any additional setup after loading the view.
    }

}
