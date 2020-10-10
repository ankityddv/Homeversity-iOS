//
//  ViewController.swift
//  HCI
//
//  Created by Ankit on 19/08/20.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {

    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var continueBttn: UIButton!
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var pleasecreateLabel: UILabel!
    @IBOutlet weak var cardView: ShadowView!
    @IBOutlet weak var labelView: UIView!
    
    
    @IBAction func signUpBttn(_ sender: Any) {
        createUser()
        //Heptic touch
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        let LogInVC =  self.storyboard!.instantiateViewController(withIdentifier: "LogInVC") as! LogInVC
        self.present(LogInVC, animated: true, completion: nil)
    }
    
    
    @IBAction func tncTapped(_ sender: Any) {
        let tncVC =  self.storyboard!.instantiateViewController(withIdentifier: "tncVC") as! tncVC
        self.present(tncVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImageBackground()
        
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
        
        //continueBttn.layer.cornerRadius = 13
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
            Auth.auth().createUser(withEmail: email, password: password){ [self] (user, error) in
                if error == nil {
                    let UpdateInfoVC =  self.storyboard!.instantiateViewController(withIdentifier: "UpdateInfoVC") as! UpdateInfoVC
                    self.present(UpdateInfoVC, animated: true, completion: nil)
                }
                else{
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                    stoploader()
                }
            }
            startloader()
        }
    }
    
    func startloader(){
        CustomLoader.instance.gifName = "giphy"
        CustomLoader.instance.showLoaderView()
    }
    
    func stoploader(){
        CustomLoader.instance.hideLoaderView()
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
        // when textfield pressed
        labelView.isHidden = true
        cardView.frame.origin.y = 130
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        // when textfield rests
        
        labelView.isHidden = false
        cardView.frame.origin.y = 314
    }
    
    // Set Background Image
    func setImageBackground(){
        let background = UIImage(named: "BG")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
        
        
    // to hide the status bar(time and battery) on top
    override var prefersStatusBarHidden: Bool{
        return false
    }
    
}

