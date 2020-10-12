//
//  EditProfileTVC.swift
//  HCI
//
//  Created by Ankit on 12/10/20.
//

import UIKit
import Firebase

class EditProfileTVC: UITableViewController {

    var selectedImage: UIImage?
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchalldetails()
        // image picker
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(openImagePicker))
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(imageTap)
        profileImageView.layer.cornerRadius = 45
        profileImageView.clipsToBounds = true
    }
    
    //MARK:- To update the user details to database
    func updateProfileImage(){
        let storageRef = Storage.storage().reference().child("user/profile_images")
        let profileImg = self.selectedImage
            
        guard let imageData = profileImg?.jpegData(compressionQuality: 0.2) else { return }
            
        guard let uid = Auth.auth().currentUser?.uid else { return }
            
        let ImageRef = storageRef.child("\(uid).png")
        _ = ImageRef.putData(imageData, metadata: nil) { (metadata, error) in
            guard let metadata = metadata else {
                return
            }
            _ = metadata.size
            ImageRef.downloadURL { (url, error) in
                guard url != nil else {
                    return
                }
            }
        }
    }

    
    //MARK:- To open imagePicker
    @objc func openImagePicker(_ sender:Any) {
        // Open Image Picker
        let pickerController = UIImagePickerController()
        pickerController.allowsEditing = true
        pickerController.delegate = (self as UIImagePickerControllerDelegate & UINavigationControllerDelegate)
        present(pickerController, animated: true, completion: nil)
            
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
            self.phoneLabel.text = phone
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
                self.profileImageView.image = UIImage(data: data!)
            }
            else{
                print(error?.localizedDescription ?? error as Any)
            }
        }
    }
    
    func fetchalldetails(){
        fetchName()
        fetchEmail()
        fetchPhone()
        fetchProfileImage()
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            
        }
        else if indexPath.section == 1 && indexPath.row == 0 {
            
        }
        else if indexPath.section == 1 && indexPath.row == 1 {
            
        }
        else if indexPath.section == 1 && indexPath.row == 2 {
            
        }
        
    }

}


// Image picker Extension
extension EditProfileTVC: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            selectedImage = image
            profileImageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}

