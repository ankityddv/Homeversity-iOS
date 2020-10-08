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
        case rainbowAppIcon
        case darkAppIcon
        case redhlogo
        case bluehlogo
        case pridehIcon1
        case pridehIcon2
        case pridehIcon3
        case pridehIcon4
        case pridehIcon5
    }
    
    func changeAppIcon(to appIcon: AppIcon) {
        let appIconValue: String? = appIcon == .primaryAppIcon ? nil : appIcon.rawValue
        application.setAlternateIconName(appIconValue)
    }

}
