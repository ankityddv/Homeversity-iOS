//
//  LostVC.swift
//  HCI
//
//  Created by Ankit on 14/10/20.
//

import UIKit

class LostVC: UIViewController {

    @IBAction func canceldidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isModalInPresentation = true
        // Do any additional setup after loading the view.
    }
    

}
