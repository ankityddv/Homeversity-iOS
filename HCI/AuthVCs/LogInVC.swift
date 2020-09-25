//
//  LogInVC.swift
//  HCI
//
//  Created by Ankit on 25/09/20.
//

import UIKit
import FirebaseAuth

class LogInVC: UIViewController {

    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var emailField: CustomTextField!
    @IBOutlet weak var passwordField: CustomTextField!
    @IBOutlet weak var continueBttn: UIButton!
    @IBOutlet weak var pleasecreateLabel: UILabel!
    @IBOutlet weak var forgotPasswordBttn: UIButton!
    
    @IBAction func continueBttnPressed(_ sender: Any) {
        loginUser()
        //Heptic touch
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    func loginUser() {
            let email = emailField.text!
            let password = passwordField.text!
            
            if email.count == 0 && password.count == 0 {
                // create the alert
                let alert = UIAlertController(title: "Invalid!!!", message: "Please enter the email and password!", preferredStyle: UIAlertController.Style.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
            else
            {
                Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                    if error == nil{
                        self.performSegue(withIdentifier: "logIn", sender: nil)
                    }
                    else{
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
                loader()
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Hide Keyboard
                NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
                NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
                NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        continueBttn.layer.cornerRadius = 13
    }
    
    func loader(){
            CustomLoader.instance.gifName = "giphy"
            CustomLoader.instance.showLoaderView()
        }
    
    // MARK: - Code below this is for hiding keyboard
        deinit {
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        }
        func hideKeyboard(){
            view.resignFirstResponder()
        }
        @objc func keyboardwilchange(notification: Notification){
            loginLabel.frame.origin.y = 143
            pleasecreateLabel.frame.origin.y = 192
            emailField.frame.origin.y = 244
            passwordField.frame.origin.y = 322
            continueBttn.frame.origin.y = 427
            forgotPasswordBttn.frame.origin.y = 389
            
        }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            hideKeyboard()
            return true
        }
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
            loginLabel.frame.origin.y = 227
            pleasecreateLabel.frame.origin.y = 277
            emailField.frame.origin.y = 329
            passwordField.frame.origin.y = 407
            continueBttn.frame.origin.y = 512
            forgotPasswordBttn.frame.origin.y = 470
            
        }
    
}
