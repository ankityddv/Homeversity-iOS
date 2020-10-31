//
//  FoundVC.swift
//  HCI
//
//  Created by Ankit on 21/09/20.
//  Give me suggestion on twitter @ankityddv (www.twitter.com/ankityddv)

import UIKit

class FoundVC: UIViewController {

    @IBOutlet weak var foundItemsInputView: UIView!
    @IBOutlet weak var descriptionInputView: UIView!
    @IBOutlet weak var continueBttn: UIButton!
    @IBOutlet weak var foundItem: UITextView!
    @IBOutlet weak var descriptionLbl: UITextView!
    
    @IBAction func canceldidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func continueDidTapped(_ sender: Any) {
        let foundItems = foundItem.text!
        let Description = descriptionLbl.text!
        if foundItems.count != 0 && Description.count != 0 {
        let ComplainRegisteredVC =  self.storyboard!.instantiateViewController(withIdentifier: "ComplainRegisteredVC") as! ComplainRegisteredVC
        self.present(ComplainRegisteredVC, animated: true, completion: nil)
        }
        else if foundItems.count == 0 && Description.count == 0 {
            // create the alert
            let alertController = UIAlertController(title: "Please enter the items and description!", message: "Fields shouldn't be left empty", preferredStyle: .alert)
            
            // add an action (button)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            // show the alert
            self.present(alertController, animated: true, completion: nil)
        }
        else if foundItems.count > 0 && Description.count == 0 {
            // create the alert
            let alertController = UIAlertController(title: "Please enter the description!", message: "Fields shouldn't be left empty", preferredStyle: .alert)
            
            // add an action (button)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            // show the alert
            self.present(alertController, animated: true, completion: nil)
        }
        else if foundItems.count == 0 && Description.count > 0 {
            // create the alert
            let alertController = UIAlertController(title: "Please enter the items!", message: "Fields shouldn't be left empty", preferredStyle: .alert)
            
            // add an action (button)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            // show the alert
            self.present(alertController, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        foundItemsInputView.layer.cornerRadius = 15
        descriptionInputView.layer.cornerRadius = 15
        self.isModalInPresentation = true
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
