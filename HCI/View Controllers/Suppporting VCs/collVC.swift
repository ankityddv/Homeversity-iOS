//
//  collVC.swift
//  HCI
//
//  Created by Ankit on 14/10/20.
//

import UIKit

class collVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    let imageArr = ["i","pridehlogo1"]
    
    @IBOutlet weak var collectionView1: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArr.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:homeCVcell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCVcell", for: indexPath) as! homeCVcell
        cell.displayImageView.image = UIImage(named: imageArr[indexPath.row])
        //add shadows
        
        cell.displayImageView.clipsToBounds = true
        cell.displayImageView.layer.masksToBounds = true
        return cell
    }
    
    /*
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var cell = collectionView.cellForItem(at: indexPath)
        
        cell?.superview!.bringSubviewToFront(cell!)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: ({
            cell?.frame = collectionView.bounds
            collectionView.isScrollEnabled = false
        }
        ), completion: nil)
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
