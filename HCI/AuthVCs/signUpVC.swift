//
//  ViewController.swift
//  HCI
//
//  Created by Ankit on 19/08/20.
//

import UIKit
import Firebase

class signUpVC: UIViewController {

    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var continueBttn: UIButton!
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var pleasecreateLabel: UILabel!
    
    
    @IBAction func signUpBttn(_ sender: Any) {
        createUser()
                
                //Heptic touch
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set Up Heptic touch quick actions on home page
        let firstIcon = UIApplicationShortcutIcon(type: UIApplicationShortcutIcon.IconType.update)
                let firstItem = UIApplicationShortcutItem(type: "jhcbjh", localizedTitle: "Room Clean", localizedSubtitle: nil, icon: firstIcon, userInfo: nil)
        let secondIcon = UIApplicationShortcutIcon(type: UIApplicationShortcutIcon.IconType.invitation)
                let secondItem = UIApplicationShortcutItem(type: "jhcbjh", localizedTitle: "Complain", localizedSubtitle: nil, icon: secondIcon, userInfo: nil)
                UIApplication.shared.shortcutItems = [firstItem,secondItem]
        
        //Hide Keyboard
                NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
                NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
                NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        continueBttn.layer.cornerRadius = 13
    }
    
    //Function to login In the User
    func createUser(){
            let email = emailTextField.text!
            let password = passwordTextField.text!
            if password.count < 6 && password.count >= 1 {
                let alertController = UIAlertController(title: "Password Invalid!", message: "Password must be greater than 6 characters!", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
                
                //heptic error
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.error)
            }
            else{
                Auth.auth().createUser(withEmail: email, password: password){ (user, error) in
                    if error == nil {
                        self.performSegue(withIdentifier: "toInfoPage", sender: nil)
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
            signUpLabel.frame.origin.y = 183
            pleasecreateLabel.frame.origin.y = 232
            emailTextField.frame.origin.y = 284
            passwordTextField.frame.origin.y = 362
            continueBttn.frame.origin.y = 467
            //UIImageView.transition(with: bgImage, duration: 1.0,
                             // options: .transitionCurlUp,
                           //   animations: { [self] in
                               // self.bgImage.isHidden = true
                          //})
        }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            hideKeyboard()
            return true
        }
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
            signUpLabel.frame.origin.y = 303
            pleasecreateLabel.frame.origin.y = 352
            emailTextField.frame.origin.y = 404
            passwordTextField.frame.origin.y = 482
            continueBttn.frame.origin.y = 587
            //UIImageView.transition(with: bgImage, duration: 0.6,
                              //options: .transitionCrossDissolve,
                              //animations: { [self] in
                                //self.bgImage.isHidden = false
                          //})
        }
        
        
        // to hide the status bar(time and battery) on top
        override var prefersStatusBarHidden: Bool{
        return false
    }



}

