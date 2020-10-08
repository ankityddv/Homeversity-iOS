//
//  tncVC.swift
//  HCI
//
//  Created by Ankit on 21/09/20.
//

import UIKit
import MessageUI

class tncVC: UIViewController {

    @IBOutlet weak var contactUsBttn: UIButton!
    
    @IBAction func contactBttntapped(_ sender: Any) {
        showMailComposer()
    }
    
    func showMailComposer(){
        
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["yadavankit840@gmail.com"])
        composer.setSubject("Support!")
        composer.setMessageBody("I love this app, but ", isHTML: false)
        present(composer, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactUsBttn.layer.cornerRadius = 13
    }

}
extension tncVC: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            if let _ = error {
                controller.dismiss(animated: true)
            }
            switch result {
            case .cancelled:
                print("Cancelled")
            case .failed:
                print("Failed to send")
            case .saved:
                print("Saved")
            case .sent:
                print("Email Sent")
            }
            controller.dismiss(animated: true)
    }
}
