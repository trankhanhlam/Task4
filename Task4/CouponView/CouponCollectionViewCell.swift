//
//  CouponCollectionViewCell.swift
//  Task4
//
//  Created by Dev iOS 2 on 5/29/19.
//  Copyright © 2019 Dev iOS 2. All rights reserved.
//

import UIKit

class CouponCollectionViewCell: UICollectionViewCell {
    var couponLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Something"
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    func setupCell() {
        addSubview(couponLabel)
        
        couponLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        couponLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        couponLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        couponLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
