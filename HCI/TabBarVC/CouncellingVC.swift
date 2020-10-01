//
//  CouncellingVC.swift
//  HCI
//
//  Created by Ankit on 20/09/20.
//

import UIKit

class CouncellingVC: UIViewController {

    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var VideoThumbnail: UIImageView!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardView.layer.cornerRadius = 10
        profileImage.layer.cornerRadius = 45
        VideoThumbnail.layer.cornerRadius = 15
        
        // To hide the top line
        self.tabBarController?.tabBar.shadowImage = UIImage()
        self.tabBarController?.tabBar.backgroundImage = UIImage()
        //self.tabBarController?.tabBar.clipToBounds = true
    }

}
extension UIView {

    func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 5
        clipsToBounds = false
    }
}
