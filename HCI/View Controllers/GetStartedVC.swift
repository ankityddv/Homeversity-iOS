//
//  GetStartedVC.swift
//  HCI
//
//  Created by Ankit on 02/10/20.
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
        
        //MARK:-
        Auth.auth().addStateDidChangeListener { auth, user in
          if user != nil {
            let homeVC =  self.storyboard!.instantiateViewController(withIdentifier: "tab_bar") as! BubbleTabBarController
            self.present(homeVC, animated: false, completion: nil)
          } else {
            let SignUpVC =  self.storyboard!.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
            self.present(SignUpVC, animated: true, completion: nil)
          }
        }
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
    
}
