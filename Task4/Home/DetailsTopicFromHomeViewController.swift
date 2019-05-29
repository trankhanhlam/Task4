//
//  DetailsTopicFromHomeViewController.swift
//  Task4
//
//  Created by Dev iOS 2 on 5/28/19.
//  Copyright © 2019 Dev iOS 2. All rights reserved.
//

import UIKit

class DetailsTopicFromHomeViewController: UIViewController {
    var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    private var titleTopicLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .green
        return label
    }()
    private var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    func setupView() {
        setupTimeLabel()
        setupTitleLabel()
        setupContentView()
    }
    func setupContentView() {
        view.addSubview(contentView)
        
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 5).isActive = true
        contentView.topAnchor.constraint(equalTo: titleTopicLabel.bottomAnchor, constant: 5).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    func setupTitleLabel() {
        view.addSubview(titleTopicLabel)
        
        titleTopicLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        titleTopicLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        titleTopicLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        titleTopicLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 5).isActive = true
    }
    func setupTimeLabel() {
        view.addSubview(timeLabel)
        
        timeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        timeLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        timeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
