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
    override func viewDidLoad() {
        super.viewDidLoad()
        foundItemsInputView.layer.cornerRadius = 15
        descriptionInputView.layer.cornerRadius = 15
        
        
    }

}
