//
//  ResetVC.swift
//  HCI
//
//  Created by Ankit on 10/10/20.
//  Give me suggestion on twitter @ankityddv (www.twitter.com/ankityddv)

import UIKit
import Firebase

class ResetVC: UIViewController {

    @IBOutlet weak var emailField: CustomTextField!
    
    @IBAction func resetpasswordBttn(_ sender: Any) {
        resetUserPassword()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK:- Function to reset User password.
    func resetUserPassword(){
        if self.emailField.text == "" {
            let alertController = UIAlertController(title: "Oops!", message: "Please enter an email.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        
        } else {
            Auth.auth().sendPasswordReset(withEmail: self.emailField.text!, completion: { (error) in
                
                var title = ""
                var message = ""
                
                if error != nil {
                    title = "Error!"
                    message = (error?.localizedDescription)!
                } else {
                    let EmailsentVC =  self.storyboard!.instantiateViewController(withIdentifier: "EmailsentVC") as! EmailsentVC
                    self.present(EmailsentVC, animated: true, completion: nil)
                }
                
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            })
        }
    }
    
}
