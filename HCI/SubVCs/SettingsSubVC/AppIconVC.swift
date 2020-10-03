//
//  AIVC.swift
//  HCI
//
//  Created by Ankit on 03/10/20.
//

import UIKit

class AppIconVC: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    //MARK:- To add app icon
    let appIconService = AppIConService()

    
    let imageArr = ["neonlogo","rainbowlogo","darklogo","redhlogo","bluehlogo","pridehlogo1","pridehlogo2","pridehlogo3","pridehlogo4","pridehlogo5"]
    let iconNameArr = ["Default","Rainbow","Dark","Red H","Blue H","Rainbow 1","Rainbow 2","Rainbow 3","Rainbow 4","Rainbow 5"]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (iconNameArr.count)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let cell:AppIconTableViewCell = tableView.dequeueReusableCell(withIdentifier: "AppIconTableViewCell", for: indexPath) as! AppIconTableViewCell
        cell.logoImageView?.image = UIImage(named: imageArr[indexPath.row])
        cell.iconTitile.text = iconNameArr[indexPath.row]
        

        return (cell)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            appIconService.changeAppIcon(to: .primaryAppIcon)
        }
        else if indexPath.row == 1{
            appIconService.changeAppIcon(to: .rainbowAppIcon)
        }
        else if indexPath.row == 2{
            appIconService.changeAppIcon(to: .darkAppIcon)
        }
        else if indexPath.row == 3{
            appIconService.changeAppIcon(to: .redhlogo)
        }
        else if indexPath.row == 4{
            appIconService.changeAppIcon(to: .bluehlogo)
        }
        else if indexPath.row == 5{
            appIconService.changeAppIcon(to: .pridehIcon1)
        }
        else if indexPath.row == 6{
            appIconService.changeAppIcon(to: .pridehIcon2)
        }
        else if indexPath.row == 7{
            appIconService.changeAppIcon(to: .pridehIcon3)
        }
        else if indexPath.row == 8{
            appIconService.changeAppIcon(to: .pridehIcon4)
        }
        else if indexPath.row == 9{
            appIconService.changeAppIcon(to: .pridehIcon5)
        }
        
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
