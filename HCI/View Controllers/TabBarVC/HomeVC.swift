//
//  CouncellingVC.swift
//  HCI
//
//  Created by Ankit on 20/09/20.
//  Give me suggestion on twitter @ankityddv (www.twitter.com/ankityddv)

import UIKit
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage

class HomeVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var fluidCard: FluidCardView!
    
    let imageArr = ["girl1","girl2","girl3","girl4"]
    let headingArr = ["Damn Bruh!","Lamao Two","YO my nigga ","ha bhai sahi h"]
    let subHeadingArr = ["Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim vexqniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.","Okay","Hmm","Okay"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArr.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:HomeCVcell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCVcell1", for: indexPath) as! HomeCVcell1
        cell.imageView1.image = UIImage(named: imageArr[indexPath.row])
        cell.headingLbl.text = headingArr[indexPath.row]
        cell.subHeadingLbl.text = subHeadingArr[indexPath.row]
        //add shadows
        cell.imageView1.layer.cornerRadius = 22.5
        cell.imageView1.clipsToBounds = true
        cell.imageView1.layer.masksToBounds = true
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchName()
        // To hide the top line
        self.tabBarController?.tabBar.shadowImage = UIImage()
        self.tabBarController?.tabBar.backgroundImage = UIImage()
        /*
        //fluid card
        let topNib = UINib(nibName: "TopView", bundle: nil)
        let topView = topNib.instantiate(withOwner: self, options: nil).first as! UIView
        let bottomNib = UINib(nibName: "BottomView", bundle: nil)
        let bottomView = bottomNib.instantiate(withOwner: self, options: nil).first as! UIView
        fluidCard.topContentView = topView
        fluidCard.bottomContentView = bottomView
        */
        // Set placeholders
        self.navigationItem.titleView = self.setTitle(title: "Loading...", subtitle: "Loading...")
    }
    
    //MARK:- To userfetch info
    func fetchName(){
        let userID = Auth.auth().currentUser?.uid
        let ref = Database.database().reference()
        ref.child("USER").child(userID ?? "0").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let username = value?["Name"] as? String ?? ""
            let bio = value?["Bio"] as? String ?? ""
            /*
            var userDict: [String: Any] = [:]
            let userkaName: String = "\(username)"
            let age: Int = 25
            let language: String = "en"

            userDict = ["username": userkaName,
                        "age": age,
                        "language": language]

            UserDefaults.standard.set(userDict, forKey: userkaName)
            
            let userData = UserDefaults.standard.dictionary(forKey: userkaName)
            let ageData = userData!["age"] // 25
            let languageData = userData!["language"] // en
            
            */
            self.navigationItem.titleView = self.setTitle(title: "Hi \(username)!", subtitle: "\(bio)")
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func setTitle(title:String, subtitle:String) -> UIView {

            //Get navigation Bar Height and Width
            let navigationBarHeight = Int(self.navigationController!.navigationBar.frame.height)
            let navigationBarWidth = Int(self.navigationController!.navigationBar.frame.width)

            //Y position for Title and Subtitle
            var y_Title = 0.0
            var y_SubTitle = 0.0

            //Set Y position
            if UIDevice().userInterfaceIdiom == .phone {
                switch UIScreen.main.nativeBounds.height {
                //If screen height equal iPhone 5S and SE
                case 1136:
                    y_Title = 46
                    y_SubTitle = 30
                    print("iPhone 5S and SE")
                //If screen height equal iPhone 6, 6+, 6S, 6S+, 7, 7+, 8, 8+ and X
                case 1334, 1920, 2208, 2436:
                    y_Title = 48
                    y_SubTitle = 28
                    print("iPhone 6, 6+, 6S, 6S+, 7, 7+, 8, 8+ and X")
                default:
                    y_Title = 52
                    y_SubTitle = 28
                    print("Default")
                }
            }

            //Set Font size and weight for Title and Subtitle
            let titleFont = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.bold)
            let subTitleFont = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.semibold)

            //Title label
            let titleLabel = UILabel(frame: CGRect(x: 8.5, y: y_Title, width: 0, height: 0))
            titleLabel.backgroundColor = UIColor.clear
            titleLabel.textColor = UIColor(named: "Black")
            titleLabel.font = titleFont
            titleLabel.text = title
            titleLabel.sizeToFit()

            //SubTitle label
            let subtitleLabel = UILabel(frame: CGRect(x: 8.5, y: y_SubTitle, width: 0, height: 0))
            subtitleLabel.backgroundColor = UIColor.clear
            subtitleLabel.textColor = UIColor.gray
            subtitleLabel.font = subTitleFont
            subtitleLabel.text = subtitle
            subtitleLabel.sizeToFit()

            //Add Title and Subtitle to View
            let titleView = UIView(frame: CGRect(x: 0, y: 0, width: navigationBarWidth, height: navigationBarHeight))
            titleView.addSubview(titleLabel)
            titleView.addSubview(subtitleLabel)

            return titleView

        }

}
extension UIView {

    func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 5
        clipsToBounds = false
    }
}
