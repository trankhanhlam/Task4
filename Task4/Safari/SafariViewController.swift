//
//  SafariViewController.swift
//  Task4
//
//  Created by Dev iOS 2 on 5/29/19.
//  Copyright © 2019 Dev iOS 2. All rights reserved.
//

import UIKit
import SafariServices

class SafariViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let safariViewController = SFSafariViewController(url: URL(string: "https://www.google.com/")!)
        safariViewController.delegate = self
        // hide navigation bar and present safari view controller
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(safariViewController, animated: true)
    }
}
extension SafariViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        // pop safari view controller and display navigation bar again
        navigationController?.popViewController(animated: true)
        navigationController?.isNavigationBarHidden = false
    }
}
