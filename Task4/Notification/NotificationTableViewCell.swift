//
//  NotificationTableViewCell.swift
//  Task4
//
//  Created by Dev iOS 2 on 5/28/19.
//  Copyright © 2019 Dev iOS 2. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    var notificationImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .green
        return image
    }()
    var notificationTitleLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .green
        return label
    }()
    var notificationTimeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .green
        return label
    }()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    func setupCell() {
        setupImage()
        setupTitle()
        setupTime()
    }
    func setupTime() {
        addSubview(notificationTimeLbl)
        
        notificationTimeLbl.leftAnchor.constraint(equalTo: notificationImage.rightAnchor, constant: 10).isActive = true
        notificationTimeLbl.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true
        notificationTimeLbl.topAnchor.constraint(equalTo: notificationTitleLbl.bottomAnchor, constant: 5).isActive = true
        notificationTimeLbl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
    }
    func setupTitle() {
        addSubview(notificationTitleLbl)
        
        notificationTitleLbl.leftAnchor.constraint(equalTo: notificationImage.rightAnchor, constant: 10).isActive = true
        notificationTitleLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        notificationTitleLbl.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true
        notificationTitleLbl.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    func setupImage() {
        addSubview(notificationImage)
        
        notificationImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        notificationImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        notificationImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        notificationImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
