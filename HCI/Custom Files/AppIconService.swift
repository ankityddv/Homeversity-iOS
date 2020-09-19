//
//  AppIconService.swift
//  HCI
//
//  Created by Ankit on 19/09/20.
//

import UIKit

class AppIConService {
    
    let application = UIApplication.shared
    
    enum AppIcon: String {
        case primaryAppIcon
        case neonAppIcon
        case darkAppIcon
    }
    
    func changeAppIcon(to appIcon: AppIcon) {
        let appIconValue: String? = appIcon == .primaryAppIcon ? nil : appIcon.rawValue
        application.setAlternateIconName(appIconValue)
    }

}
