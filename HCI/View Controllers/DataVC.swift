//
//  DataVC.swift
//  HCI
//
//  Created by Ankit on 08/10/20.
//

import UIKit
import Firebase

class DataVC: UIViewController {

    @IBOutlet weak var dpImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var PhoneLabel: UILabel!
    
    //To fetch info
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
        func fetchProfileImage(){
            //retrive image
            guard let uid = Auth.auth().currentUser?.uid else { return }
            let storageRef = Storage.storage().reference().child("user/profile_images")
            let imageRef = storageRef.child("\(uid).png")
            imageRef.getData(maxSize: 1*1000*1000) { (data,error) in
                if error == nil{
                    print(data ?? Data.self)
                    self.dpImageView.image = UIImage(data: data!)
                }
                else{
                    print(error?.localizedDescription ?? error as Any)
                }
            }
        }
    func fetchPhone(){
        let userID = Auth.auth().currentUser?.uid
        let ref = Database.database().reference()
        ref.child("USER").child(userID ?? "0").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let phone = value?["Phone"] as? String ?? ""
            self.PhoneLabel.text = phone
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchName()
        fetchPhone()
        fetchProfileImage()
    }

}
