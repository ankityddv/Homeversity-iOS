//
//  AddImageVC.swift
//  HCI
//
//  Created by Ankit on 21/08/20.
//

import UIKit
import Firebase
import FirebaseDatabase

class AddImageVC: UIViewController {
    
    var ref:DatabaseReference?
    var selectedImage: UIImage?

    @IBOutlet weak var addDetailsLabel: UILabel!
    @IBOutlet weak var fillDetailsLabel: UILabel!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var imageViewbg: UIView!
    @IBOutlet weak var continueBttn: UIButton!
    @IBOutlet weak var uploadLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameTextField: CustomTextField!
    @IBOutlet weak var contactTextField: CustomTextField!
    
    // Tap actions
    @IBAction func continueBttnTapped(_ sender: Any) {
        updateProfileImage()
        updateData()
        self.performSegue(withIdentifier: "gotoHome", sender: nil)
    }
    
    // To open imagePicker
    @objc func openImagePicker(_ sender:Any) {
        // Open Image Picker
        let pickerController = UIImagePickerController()
        pickerController.allowsEditing = true
        pickerController.delegate = (self as UIImagePickerControllerDelegate & UINavigationControllerDelegate)
        present(pickerController, animated: true, completion: nil)
            
    }
    
    // To update the user details
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
    
    func updateData() {
        self.ref = Database.database().reference()
        guard let uid = Auth.auth().currentUser?.uid else { return }
        if self.contactTextField.text != "" && self.nameTextField.text != ""
        {
            self.ref?.child("USER").child(uid).setValue(["Name" : self.nameTextField.text ,"Phone" : self.contactTextField.text])
        }
        else
        {
            print("error")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(openImagePicker))
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(imageTap)
        profileImage.layer.cornerRadius = 35
        profileImage.clipsToBounds = true
        imageViewbg.layer.cornerRadius = 40
        imageViewbg.dropShadow(color: .black, opacity: 0.25, offSet: CGSize(width: 0, height: 1), radius: 40, scale: true)
        continueBttn.layer.cornerRadius = 13
        profileImage.layer.cornerRadius = 10
        
        //Hide Keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
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
        nameTextField.frame.origin.y = 402
        contactTextField.frame.origin.y = 478
        profileImage.frame = CGRect(x: 12.5, y: 12.7, width: 110, height: 110)
        profileImage.layer.cornerRadius = 25
        imageViewbg.frame = CGRect(x: 141, y: 115, width: 133, height:133 )
        bgImage.frame.origin.y = -85
        addDetailsLabel.frame.origin.y = 290
        fillDetailsLabel.frame.origin.y = 345
        UIImageView.transition(with: bgImage, duration: 1.0,
                            options: .transitionCurlUp,
                            animations: { [self] in
                            self.bgImage.isHidden = true
                        })
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        nameTextField.frame.origin.y = 512
        contactTextField.frame.origin.y = 588
        profileImage.frame = CGRect(x: 17, y: 17, width: 200, height: 200 )
        profileImage.layer.cornerRadius = 35
        bgImage.frame.origin.y = 0
        imageViewbg.frame = CGRect(x: 90, y: 115, width: 235, height:235 )
        addDetailsLabel.frame.origin.y = 410
        fillDetailsLabel.frame.origin.y = 465
        //uploadLabel.textColor = UIColor.white
        UIImageView.transition(with: bgImage, duration: 0.6,
                            options: .transitionCrossDissolve,
                            animations: { [self] in
                            self.bgImage.isHidden = false
                        })
    }
        
        
    // to hide the status bar(time and battery) on top
    override var prefersStatusBarHidden: Bool{
        return false
    }
        

}
extension UIView {

    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
   }

  // OUTPUT 2
  func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius

        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }
    
}


// Image picker Extension
extension AddImageVC: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            selectedImage = image
            profileImage.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}


// Image crop Extension
extension UIImage {
    func getCropRatio() -> CGFloat {
        let widthRatio = CGFloat(self.size.width / self.size.height)
        return widthRatio
    }
}

