//
//  complainVC.swift
//  HCI
//
//  Created by Ankit on 24/09/20.
//

import UIKit

class complainVC: UIViewController {
    
    @IBOutlet weak var complainView: UIView!
    @IBOutlet weak var complainTextView: UITextView!
    @IBOutlet weak var proceedBttn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        complainView.layer.cornerRadius = 15
        proceedBttn.layer.cornerRadius = 13
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
