//
//  SettingsVC.swift
//  HCI
//
//  Created by Ankit on 19/09/20.
//

import UIKit

class SettingsVC: UIViewController {

    
    let appIconService = AppIConService()
    
    @IBAction func didTapPrimaryIcon() {
        appIconService.changeAppIcon(to: .primaryAppIcon)
    }
    
    @IBAction func didTapNeonIcon() {
        appIconService.changeAppIcon(to: .neonAppIcon)
    }

    @IBAction func didTapDarkIcon()  {
        appIconService.changeAppIcon(to: .darkAppIcon)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
