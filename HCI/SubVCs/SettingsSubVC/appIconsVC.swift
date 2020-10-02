//
//  SettingsVC.swift
//  HCI
//
//  Created by Ankit on 19/09/20.
//

import UIKit

class appIconsVC: UIViewController {
    
    @IBOutlet weak var icon1: UIButton!
    @IBOutlet weak var icon2: UIButton!
    @IBOutlet weak var icon3: UIButton!
    @IBOutlet weak var icon4: UIButton!
    @IBOutlet weak var icon5: UIButton!
    @IBOutlet weak var icon6: UIButton!
    

    // To add app icon
    let appIconService = AppIConService()
    
    // Icon 1
    @IBAction func didTapPrimaryIcon() {
        appIconService.changeAppIcon(to: .primaryAppIcon)
    }
    // Icon 2
    @IBAction func didTapNeonIcon() {
        appIconService.changeAppIcon(to: .neonAppIcon)
    }
    // Icon 3
    @IBAction func didTapDarkIcon()  {
        appIconService.changeAppIcon(to: .darkAppIcon)
    }
    // Icon 4
    @IBAction func didTapRedHIcon(_ sender: Any) {
        appIconService.changeAppIcon(to: .redhlogo)
    }
    // Icon 5
    @IBAction func didTapPride1Icon(_ sender: Any) {
        appIconService.changeAppIcon(to: .pridehlogo1)
    }
    // Icon 6
    @IBAction func didTapBlueIcon(_ sender: Any) {
        appIconService.changeAppIcon(to: .bluehlogo)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        icon1.imageView?.layer.cornerRadius = 20
        icon2.imageView?.layer.cornerRadius = 20
        icon3.imageView?.layer.cornerRadius = 20
        icon4.imageView?.layer.cornerRadius = 20
        icon5.imageView?.layer.cornerRadius = 20
        icon6.imageView?.layer.cornerRadius = 20
    }

}
