//
//  LnfVC.swift
//  HCI
//
//  Created by Ankit on 24/09/20.
//  Give me suggestion on twitter @ankityddv (www.twitter.com/ankityddv)

import UIKit

class DislodgeVC: UIViewController {

    @IBOutlet weak var lostBttn: UIButton!
    @IBOutlet weak var foundBttn: UIButton!
    @IBOutlet weak var imageVieww: UIImageView!
    @IBOutlet weak var lostImageVieww: UIImageView!
    @IBOutlet weak var foundImageVieww: UIImageView!
    
    // The action performed via segues.
    @IBAction func lostBttnTapped(_ sender: Any) {
        //let LostVC =  self.storyboard!.instantiateViewController(withIdentifier: "LostVC") as! LostVC
        //self.present(LostVC, animated: true, completion: nil)
    }
    @IBAction func foundBttnTapped(_ sender: Any) {
        //let FoundVC =  self.storyboard!.instantiateViewController(withIdentifier: "FoundVC") as! FoundVC
        //self.present(FoundVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lostBttn.layer.cornerRadius = 23
        foundBttn.layer.cornerRadius = 23
        // To hide the top line
        self.tabBarController?.tabBar.shadowImage = UIImage()
        self.tabBarController?.tabBar.backgroundImage = UIImage()
        lostImageVieww.loadGif(name: "lost")
        foundImageVieww.loadGif(name: "found")
        imageVieww.loadGif(name: "dislodge")
    }

}
