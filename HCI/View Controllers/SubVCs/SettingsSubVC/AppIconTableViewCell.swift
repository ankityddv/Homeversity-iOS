//
//  AppIconTableViewCell.swift
//  HCI
//
//  Created by Ankit on 03/10/20.
//

import UIKit

class AppIconTableViewCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var iconTitile: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        logoImageView.layer.cornerRadius = 20
        logoImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
