//
//  GetStartedVC.swift
//  HCI
//
//  Created by Ankit on 02/10/20.
//  Give me suggestion on twitter @ankityddv (www.twitter.com/ankityddv)
//
// VC to operate the liquid swipe operations

import UIKit
import liquid_swipe
import Firebase


class ColoredController: UIViewController {
    
    var viewColor: UIColor = .white {
        didSet {
            viewIfLoaded?.backgroundColor = viewColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = viewColor
    }
}

class GetStartedVC: LiquidSwipeContainerController, LiquidSwipeContainerDataSource {
    // Add identifiers of VCs which are to be presented.
    var viewControllers: [UIViewController] = {
        let firstPageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "page1")
        let secondPageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "page2")
        let thirdPageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "page3")
        var controllers: [UIViewController] = [firstPageVC, secondPageVC, thirdPageVC]
        return controllers
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datasource = self
        userLoggedIn()
        //Set Up Heptic touch quick actions on home page
        let firstIcon = UIApplicationShortcutIcon(type: UIApplicationShortcutIcon.IconType.update)
                let firstItem = UIApplicationShortcutItem(type: "jhcbjh", localizedTitle: "Room Clean", localizedSubtitle: nil, icon: firstIcon, userInfo: nil)
        let secondIcon = UIApplicationShortcutIcon(type: UIApplicationShortcutIcon.IconType.invitation)
                let secondItem = UIApplicationShortcutItem(type: "jhcbjh", localizedTitle: "Complain", localizedSubtitle: nil, icon: secondIcon, userInfo: nil)
                UIApplication.shared.shortcutItems = [firstItem,secondItem]
    }

    func numberOfControllersInLiquidSwipeContainer(_ liquidSwipeContainer: LiquidSwipeContainerController) -> Int {
        return viewControllers.count
    }
    
    func liquidSwipeContainer(_ liquidSwipeContainer: LiquidSwipeContainerController, viewControllerAtIndex index: Int) -> UIViewController {
        return viewControllers[index]
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    func userLoggedIn(){
        Auth.auth().addStateDidChangeListener { auth, user in
          if user != nil {
            let homeVC =  self.storyboard!.instantiateViewController(withIdentifier: "tab_bar") as! BubbleTabBarController
            self.present(homeVC, animated: false, completion: nil)
          }
          else {
            let OnboardingVC =  self.storyboard!.instantiateViewController(withIdentifier: "OnboardingVC") as! OnboardingVC
            self.present(OnboardingVC, animated: true, completion: nil)
          }
        }
    }
    
}
