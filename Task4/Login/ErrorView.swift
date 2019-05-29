import UIKit
import Foundation

class ErrorView: UIView {
    var errorLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Error"
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    func setupLabel() {
        addSubview(errorLbl)
        
        errorLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        errorLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        errorLbl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
