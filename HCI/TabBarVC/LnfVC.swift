//
//  LnfVC.swift
//  HCI
//
//  Created by Ankit on 24/09/20.
//

import UIKit

class LnfVC: UIViewController {

    @IBOutlet weak var lostBttn: UIButton!
    @IBOutlet weak var foundBttn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lostBttn.layer.cornerRadius = 18
        foundBttn.layer.cornerRadius = 18
        
        // To hide the top line
        self.tabBarController?.tabBar.shadowImage = UIImage()
        self.tabBarController?.tabBar.backgroundImage = UIImage()
    }

}
