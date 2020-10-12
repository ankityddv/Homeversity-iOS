//
//  MenuTVC.swift
//  HCI
//
//  Created by Ankit on 25/09/20.
//  Give me suggestion on twitter @ankityddv (www.twitter.com/ankityddv)

import UIKit
import MessageUI
import Firebase

class MenuTVC: UITableViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // To hide the top line
        self.tabBarController?.tabBar.shadowImage = UIImage()
        self.tabBarController?.tabBar.backgroundImage = UIImage()
        profileImage.layer.cornerRadius = 22.5
        fetchName()
        fetchEmail()
        fetchProfileImage()
    }
    
    //MARK:- To userfetch info
    func fetchName(){
        let userID = Auth.auth().currentUser?.uid
        let ref = Database.database().reference()
        ref.child("USER").child(userID ?? "0").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let username = value?["Name"] as? String ?? ""
            self.nameLabel.text = username
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func fetchEmail(){
        let userEmail = Auth.auth().currentUser?.email
        self.emailLabel.text = userEmail
    }
    
    func fetchPhone(){
        let userID = Auth.auth().currentUser?.uid
        let ref = Database.database().reference()
        ref.child("USER").child(userID ?? "0").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let phone = value?["Phone"] as? String ?? ""
            //self.PhoneLabel.text = phone
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func fetchProfileImage(){
        //retrive image
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let storageRef = Storage.storage().reference().child("user/profile_images")
        let imageRef = storageRef.child("\(uid).png")
        imageRef.getData(maxSize: 1*1000*1000) { (data,error) in
            if error == nil{
                print(data ?? Data.self)
                self.profileImage.image = UIImage(data: data!)
            }
            else{
                print(error?.localizedDescription ?? error as Any)
            }
        }
    }
    
    //MARK:- Open Mail VC
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
        /*
        // MARK: - Profile Settings (SECTION 0)
        if indexPath.section == 0 && indexPath.row == 0{
            let EditProfileVC =  self.storyboard!.instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileVC
            self.present(EditProfileVC, animated: true, completion: nil)
        }
         
        // MARK: - General Settings (SECTION 1)
        else if indexPath.section == 1 && indexPath.row == 0 {
            let appIconsVC =  self.storyboard!.instantiateViewController(withIdentifier: "appicons") as! AppIconVC
            self.present(appIconsVC, animated: true, completion: nil)
        }
         */
        
        // MARK: - Reach Us (SECTION 2)
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
        /*
        // MARK: - Reset Password (SECTION 4)
        else if indexPath.section == 4 && indexPath.row == 0{
            let resetVC =  self.storyboard!.instantiateViewController(withIdentifier: "ResetVC") as! ResetVC
            self.present(resetVC, animated: true, completion: nil)
        }
        */
        
        // MARK: - Appointment Page (SECTION 5)
        else if indexPath.section == 5 && indexPath.row == 0{
            let BookAppointmentVC =  self.storyboard!.instantiateViewController(withIdentifier: "BookAppointmentVC") as! BookAppointmentVC
            self.present(BookAppointmentVC, animated: true, completion: nil)
        }
        
        // MARK: - Sign Out (SECTION 6)
        else if indexPath.section == 6 && indexPath.row == 0{
            
            if Auth.auth().currentUser != nil {
                do {
                    try Auth.auth().signOut()
                    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpVC")
                    present(vc, animated: true, completion: nil)
                    //UserDefaults.standard.setValue(false, forKey: "isloggedIn")
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
    }
}

extension MenuTVC: MFMailComposeViewControllerDelegate {
    
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
