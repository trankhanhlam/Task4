//
//  TabbarViewController.swift
//  Task4
//
//  Created by Dev iOS 2 on 5/28/19.
//  Copyright © 2019 Dev iOS 2. All rights reserved.
//

import UIKit
import SafariServices

class TabbarViewController: UITabBarController, UITabBarControllerDelegate {
    
    let homeViewController = HomeViewController()
    let secondViewController = LoginNeededViewController()
    let thirdViewController = WebViewController()
    let navi = UINavigationController(rootViewController: WebViewController())
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self

        let naviForHomeView = UINavigationController(rootViewController: homeViewController)
        naviForHomeView.title = "HOME"
        
        let naviForLoginView = UINavigationController(rootViewController: secondViewController)
        naviForLoginView.title = "LOGIN"
        secondViewController.title = "LOGIN"
        
        let naviForWebView = UINavigationController(rootViewController: thirdViewController)
        naviForWebView.title = "WEB"
        thirdViewController.title = "WEB"
        tabBar.barTintColor = .red
        tabBar.tintColor = .white
        viewControllers = [naviForHomeView, secondViewController, thirdViewController]
    }
    private func setupAlert() {
        let alert = UIAlertController(title: "Please log-in for continnue", message: "", preferredStyle: UIAlertControllerStyle.alert)
        let signUp = UIAlertAction(title: "SIGNUP", style: .default, handler: nil)
        let login = UIAlertAction(title: "LOGIN", style: .default) { (action) in
            let navi = UINavigationController(rootViewController: LoginViewController())
            self.present(navi, animated: true, completion: nil)
        }
        let cancel = UIAlertAction(title: "CANCEL", style: .cancel, handler: nil)
        alert.addAction(signUp)
        alert.addAction(login)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is LoginNeededViewController {
            setupAlert()
            return false
        }else if viewController is WebViewController {
            let controller = SFSafariViewController(url: URL(string: "https://www.google.com/")!)
            self.present(controller, animated: true, completion: nil)
            return false
        }
        return true
    }
}
