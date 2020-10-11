//
//  InitialVC.swift
//  HCI
//
//  Created by Ankit on 11/10/20.
//  Give me suggestion on twitter @ankityddv (www.twitter.com/ankityddv)

import UIKit
import Firebase

class InitialVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:- to check if user is logged in or not.
        Auth.auth().addStateDidChangeListener { auth, user in
          if user != nil {
            let homeVC =  self.storyboard!.instantiateViewController(withIdentifier: "tab_bar") as! BubbleTabBarController
            self.present(homeVC, animated: false, completion: nil)
          }
          else {
            let GetStartedVC =  self.storyboard!.instantiateViewController(withIdentifier: "GetStartedVC") as! GetStartedVC
            self.present(GetStartedVC, animated: false, completion: nil)
          }
        }
    }

}
