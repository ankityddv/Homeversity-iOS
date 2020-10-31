//
//  complainVC.swift
//  HCI
//
//  Created by Ankit on 24/09/20.
//  Give me suggestion on twitter @ankityddv (www.twitter.com/ankityddv)

import UIKit

class ComplaintVC: UIViewController {
    
    @IBOutlet weak var complainView: UIView!
    @IBOutlet weak var complainTextView: UITextView!
    @IBOutlet weak var proceedBttn: UIButton!
    @IBOutlet weak var titletextField: CustomTextField!
    
    @IBAction func confirmedBttnTapped(_ sender: Any) {
        let title = titletextField.text!
        let details = complainTextView.text!
        if title.count != 0 && details.count != 0 {
        let ComplainRegisteredVC =  self.storyboard!.instantiateViewController(withIdentifier: "ComplainRegisteredVC") as! ComplainRegisteredVC
        self.present(ComplainRegisteredVC, animated: true, completion: nil)
        }
        else if title.count == 0 && details.count == 0 {
            // create the alert
            let alertController = UIAlertController(title: "Please enter the title and details!", message: "Fields shouldn't be left empty", preferredStyle: .alert)
            
            // add an action (button)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            // show the alert
            self.present(alertController, animated: true, completion: nil)
        }
        else if title.count > 0 && details.count == 0 {
            // create the alert
            let alertController = UIAlertController(title: "Please enter the details!", message: "Fields shouldn't be left empty", preferredStyle: .alert)
            
            // add an action (button)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            // show the alert
            self.present(alertController, animated: true, completion: nil)
        }
        else if title.count == 0 && details.count > 0 {
            // create the alert
            let alertController = UIAlertController(title: "Please enter the title!", message: "Fields shouldn't be left empty", preferredStyle: .alert)
            
            // add an action (button)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            // show the alert
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        complainView.layer.cornerRadius = 15
        proceedBttn.layer.cornerRadius = 13
        // To hide the top line
        self.tabBarController?.tabBar.shadowImage = UIImage()
        self.tabBarController?.tabBar.backgroundImage = UIImage()
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
            
        }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            hideKeyboard()
            return true
        }
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
            
        }

}
