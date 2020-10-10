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
    
    var handle: AuthStateDidChangeListenerHandle?

      override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if Auth.auth().currentUser != nil{
          // go to main screen
          let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Home")
          self.present(vc, animated: true, completion: nil)
          }else{

          // go to login screen
          let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signUp")
            self.present(vc, animated: true, completion: nil)
         }

        })

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
