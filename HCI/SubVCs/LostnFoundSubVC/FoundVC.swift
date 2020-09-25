//
//  FoundVC.swift
//  HCI
//
//  Created by Ankit on 21/09/20.
//

import UIKit

class FoundVC: UIViewController {

    @IBOutlet weak var foundItemsInputView: UIView!
    @IBOutlet weak var descriptionInputView: UIView!
    @IBOutlet weak var continueBttn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foundItemsInputView.layer.cornerRadius = 15
        descriptionInputView.layer.cornerRadius = 15
        continueBttn.layer.cornerRadius = 13
        
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
