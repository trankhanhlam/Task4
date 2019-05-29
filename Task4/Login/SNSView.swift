import UIKit
import GoogleSignIn

class SNSView: UIView {
    
    var stackViewLeft: UIStackView = {
        let view = UIStackView()
        return view
    }()
    var faceButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return button
    }()
    
    var googleButton: GIDSignInButton = {
        let button = GIDSignInButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return button
    }()
    var lineButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return button
    }()
    //MARK: Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                withError error: NSError!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
            // ...
        } else {
            print("\(error.localizedDescription)")
        }
    }
    func setupView() {
        setupStackViewLeft()
    }
    func setupStackViewLeft() {
        addSubview(stackViewLeft)
        stackViewLeft.translatesAutoresizingMaskIntoConstraints = false
        stackViewLeft.axis = .vertical
        stackViewLeft.distribution = .fillEqually
        stackViewLeft.alignment = .center
        stackViewLeft.spacing = 10
        
        stackViewLeft.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        stackViewLeft.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        stackViewLeft.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        stackViewLeft.widthAnchor.constraint(equalToConstant: self.frame.width / 2)
        
        stackViewLeft.addArrangedSubview(lineButton)
        stackViewLeft.addArrangedSubview(googleButton)
        stackViewLeft.addArrangedSubview(faceButton)
        
    }
    func setupLineButton() {
        addSubview(lineButton)
        
        lineButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        lineButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        lineButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        lineButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    func setupGoogleButton() {
        addSubview(googleButton)
        
        googleButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        googleButton.bottomAnchor.constraint(equalTo: lineButton.topAnchor, constant: -10).isActive = true
        googleButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        googleButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
