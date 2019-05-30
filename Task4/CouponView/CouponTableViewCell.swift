//
//  CouponTableViewCell.swift
//  Task4
//
//  Created by Dev iOS 2 on 5/29/19.
//  Copyright © 2019 Dev iOS 2. All rights reserved.
//

import UIKit

class CouponTableViewCell: UITableViewCell {
    var delegate: CouponViewController!
    
    var buttonAlertInfo: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Info", for: .normal)
        button.contentHorizontalAlignment = .right
        return button
    }()
    var imageCoupon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .green
        return image
    }()
    var buttonAccept: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ACCEPT", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .center
        button.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        button.layer.cornerRadius = 15
        return button
    }()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    func setupCell() {
        setupButtonAcceapt()
        setupImageCoupon()
        setupLabelInfoAlert()
    }
    func setupLabelInfoAlert() {
        addSubview(buttonAlertInfo)
        
        buttonAlertInfo.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        buttonAlertInfo.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        buttonAlertInfo.topAnchor.constraint(equalTo: imageCoupon.bottomAnchor, constant: 5).isActive = true
        buttonAlertInfo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        buttonAlertInfo.addTarget(self, action: #selector(buttonInfoAlertTapped), for: .touchUpInside)
    }
    @objc func buttonInfoAlertTapped() {
        let vc = AlertViewController()
        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        delegate.present(vc, animated: true, completion: nil)
    }
    func setupImageCoupon() {
        addSubview(imageCoupon)
        
        imageCoupon.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        imageCoupon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        imageCoupon.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        imageCoupon.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }
    func setupButtonAcceapt() {
        addSubview(buttonAccept)
        
        buttonAccept.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 25).isActive = true
        buttonAccept.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -25).isActive = true
        buttonAccept.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        buttonAccept.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonAccept.addTarget(self, action: #selector(buttonAcceptTapped), for: .touchUpInside)
    }
    @objc func buttonAcceptTapped() {
        
        let alert = UIAlertController(title: "Confirm", message: "Do you confirm?", preferredStyle: .alert)
        let buttonAlertOK = UIAlertAction(title: "OK", style: .default, handler: nil)
        let buttonAlertCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(buttonAlertOK)
        alert.addAction(buttonAlertCancel)
        delegate.present(alert, animated: true, completion: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
