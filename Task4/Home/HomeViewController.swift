//
//  HomeViewController.swift
//  Task4
//
//  Created by Dev iOS 2 on 5/28/19.
//  Copyright © 2019 Dev iOS 2. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    var listArti: [Article] = []
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        
        // below code create swipe gestures function
        Helper.shared.connectToJson { (list) in
            self.listArti = list
            self.tableView.reloadData()
        }
    }
    private func setupRightBarButton() {
        //create a new button
        let button: UIButton = UIButton(type: UIButtonType.custom)
        //set image for button
        //button.setImage(UIImage(named: "download"), for: .normal)
        //add function for button
        //        button.addTarget(self, action: "fbButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
        //set frame
        button.frame = CGRect(x: 0, y: 0, width: 53, height: 31)
//        let barButton = UIBarButtonItem(customView: button)
        let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(rightBarButtonTapped))
        //assign button to navigationbar
        self.navigationItem.rightBarButtonItem = barButton
    }
    @objc func rightBarButtonTapped() {
        let vcTobePush = NotificationViewController()
        self.navigationController?.pushViewController(vcTobePush, animated: true)
    }
    func setupView() {
        setupTableView()
        setupRightBarButton()
    }
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArti.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HomeTableViewCell()
        cell.textLabel?.text = listArti[indexPath.row].title
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func formattedDateFromString(dateString: String, withFormat format: String) -> String? {        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy'-'MM'-'dd' 'HH':'mm':'ss"
        if let date = inputFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = format
            return outputFormatter.string(from: date)
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcTobePush = DetailsTopicFromHomeViewController()
        self.navigationController?.pushViewController(vcTobePush, animated: true)
        let dateString = formattedDateFromString(dateString: listArti[indexPath.row].publish_at, withFormat: "dd/MM/yyyy")
        vcTobePush.timeLabel.text = dateString
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
