//
//  AccountTVC.swift
//  HCI
//
//  Created by Ankit on 25/09/20.
//

import UIKit
import MessageUI
import FirebaseAuth

class AccountTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // To hide the top line
        self.tabBarController?.tabBar.shadowImage = UIImage()
        self.tabBarController?.tabBar.backgroundImage = UIImage()
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
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Reach Us Section
        if indexPath.section == 2 && indexPath.row == 0 {
            showMailComposer()
        }
        else if indexPath.section == 2 && indexPath.row == 1{
            let screenName =  "ankityddv"
            let appURL = NSURL(string: "twitter://user?screen_name=\(screenName)")!
            let webURL = NSURL(string: "https://twitter.com/\(screenName)")!

            let application = UIApplication.shared

            if application.canOpenURL(appURL as URL) {
                application.open(appURL as URL)
            } else {
                application.open(webURL as URL)
            }
        }
        // Sign Out Section
        else if indexPath.section == 4 && indexPath.row == 0{
            try!Auth.auth().signOut()
            self.performSegue(withIdentifier: "loggedOut", sender: self)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}

extension AccountTVC: MFMailComposeViewControllerDelegate {
    
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
