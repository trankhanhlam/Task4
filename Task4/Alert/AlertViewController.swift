//
//  AlertViewController.swift
//  Task4
//
//  Created by Dev iOS 2 on 5/29/19.
//  Copyright © 2019 Dev iOS 2. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    var viewAlert: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        return view
    }()
    var buttonExit: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.setTitle("DONE", for: .normal)
        return button
    }()
    var labelTitleAlert: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title Alert"
        label.textAlignment = .center
        return label
    }()
    var subViewAlert: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setupView()
    }
    func setupView() {
        setupViewAlert()
        setupButtonExit()
        setupLabelTitleAlert()
        setupSubViewAlert()
    }
    func setupSubViewAlert() {
        viewAlert.addSubview(subViewAlert)
        
        subViewAlert.leftAnchor.constraint(equalTo: viewAlert.leftAnchor, constant: 10).isActive = true
        subViewAlert.rightAnchor.constraint(equalTo: viewAlert.rightAnchor, constant: -10).isActive = true
        subViewAlert.topAnchor.constraint(equalTo: labelTitleAlert.bottomAnchor, constant: 10).isActive = true
        subViewAlert.bottomAnchor.constraint(equalTo: buttonExit.topAnchor, constant: -10).isActive = true
    }
    func setupViewAlert() {
        view.addSubview(viewAlert)
        
        viewAlert.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewAlert.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        viewAlert.widthAnchor.constraint(equalToConstant: view.frame.width - 20).isActive = true
        viewAlert.heightAnchor.constraint(equalToConstant: view.frame.height - 240).isActive = true
        
        //setupBlurEffect
        let blurFx = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurFxView = UIVisualEffectView(effect: blurFx)
        blurFxView.frame = view.bounds
        blurFxView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(blurFxView, at: 0)
    }
    
    func setupButtonExit() {
        viewAlert.addSubview(buttonExit)
        
        buttonExit.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonExit.leftAnchor.constraint(equalTo: viewAlert.leftAnchor, constant: 10).isActive = true
        buttonExit.rightAnchor.constraint(equalTo: viewAlert.rightAnchor, constant: -10).isActive = true
        buttonExit.bottomAnchor.constraint(equalTo: viewAlert.bottomAnchor, constant: -10).isActive = true
        buttonExit.addTarget(self, action: #selector(buttonExitTapped), for: .touchUpInside)
    }
    
    func setupLabelTitleAlert() {
        viewAlert.addSubview(labelTitleAlert)
        
        labelTitleAlert.leftAnchor.constraint(equalTo: viewAlert.leftAnchor, constant: 10).isActive = true
        labelTitleAlert.rightAnchor.constraint(equalTo: viewAlert.rightAnchor, constant: -10).isActive = true
        labelTitleAlert.topAnchor.constraint(equalTo: viewAlert.topAnchor, constant: 10).isActive = true
        labelTitleAlert.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    @objc func buttonExitTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
