import UIKit
import GoogleSignIn

class LoginViewController: UIViewController,GIDSignInUIDelegate {
    //MARK: Element
    
    var loginView: LoginView = {
        let view =  LoginView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var snsView: SNSView = {
        let view = SNSView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var accountView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var errorView: ErrorView = {
        let view = ErrorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("signup", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1) , for: .normal)
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return button
    }()
    var forgotPassButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("forgotpass", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(forgotPassTapped), for: .touchUpInside)
        return button
    }()
    var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("LOGIN", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.07843137255, blue: 0.05490196078, alpha: 1)
        return button
    }()
    var forgotAndSignUpStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillEqually
        view.alignment = .center
        view.spacing = 5
        return view
    }()
    var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isScrollEnabled = true
        return view
    }()
    //MARK: ViewCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setupView()
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewDidAppear(_ animated: Bool) {
        scrollView.contentSize = CGSize(width: loginView.frame.width, height: UIScreen.main.bounds.height)
    }
    
    //MARK: Method Setup
    func setupView() {
        setupLoginButton()
        setupScrollView()
    }
    
    func setupErrorView() {
        view.addSubview(errorView)
        
        errorView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        errorView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        errorView.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 10).isActive = true
        errorView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        errorView.errorLbl.text = "Error"
    }
    func setupLoginButton() {
        view.addSubview(loginButton)
        
        loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    func setupScrollView() {
        //setup SCROLLVIEW
        view.addSubview(scrollView)
        
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -10).isActive = true
        
        //setup LOGINVIEW
        scrollView.addSubview(loginView)
        
        loginView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        loginView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0).isActive = true
        loginView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        //        loginView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        loginView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        
        //setup SNSVIEW
        scrollView.addSubview(snsView)
        snsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        snsView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        snsView.topAnchor.constraint(equalTo: loginView.bottomAnchor , constant: 10).isActive = true
        
        //setup FORGOTANDSIGNUPVIEW
        scrollView.addSubview(forgotAndSignUpStackView)
        forgotAndSignUpStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        forgotAndSignUpStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        forgotAndSignUpStackView.topAnchor.constraint(equalTo: snsView.bottomAnchor, constant: 50).isActive = true
        
        forgotAndSignUpStackView.addArrangedSubview(signUpButton)
        forgotAndSignUpStackView.addArrangedSubview(forgotPassButton)
    }
    
    @objc func signUpButtonTapped() {
        self.present(TabbarViewController(), animated: true, completion: nil)
    }
    @objc func forgotPassTapped() {
//        let vc = ThirdViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func loginButtonTapped() {
        if loginView.passwordTextField.text == "123" {
            scrollView.addSubview(errorView)
            errorView.removeFromSuperview()
            snsView.topConstaint?.constant = 10
            let vc = TabbarViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            vc.viewControllers?.remove(at: 1)
            let vcInsert = CouponViewController()
            vc.viewControllers?.insert(vcInsert, at: 1)
            vc.viewControllers![1].title = "LOGIN"
        }else {
            scrollView.addSubview(errorView)
            setupErrorView()
            snsView.topConstaint?.constant = 50
        }
    }
}

extension UIView {
    
    var heightConstaint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .height && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
    
    var widthConstaint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .width && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
    
    var topConstaint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .top && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
}
