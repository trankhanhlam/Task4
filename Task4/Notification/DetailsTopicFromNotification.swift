import UIKit

class DetailsTopicFromNotification: UIViewController {
    private var timeTopicLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .green
        return label
    }()
    private var titleTopicLbl: UILabel = {
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
        setupTimeTopic()
        setupTitleTopic()
        setupContentView()
        setupRightBarButton()
    }
    private func setupRightBarButton() {
        //create a new button
        let button: UIButton = UIButton(type: UIButtonType.custom)
        //set image for button
        //button.setImage(UIImage(named: "download"), for: .normal)
        //add function for button
        //        button.addTarget(self, action: "fbButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
        //set frame
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        //        let barButton = UIBarButtonItem(customView: button)
        let barButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(rightBarButtonTapped))
        //assign button to navigationbar
        self.navigationItem.rightBarButtonItem = barButton
    }
    @objc func rightBarButtonTapped() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    private func setupTimeTopic() {
        view.addSubview(timeTopicLbl)
        
        timeTopicLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        timeTopicLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        timeTopicLbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        timeTopicLbl.widthAnchor.constraint(equalToConstant: 180).isActive = true
    }
    private func setupTitleTopic() {
        view.addSubview(titleTopicLbl)
        
        titleTopicLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        titleTopicLbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        titleTopicLbl.topAnchor.constraint(equalTo: timeTopicLbl.bottomAnchor, constant: 10).isActive = true
        titleTopicLbl.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    private func setupContentView() {
        view.addSubview(contentView)
        
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        contentView.topAnchor.constraint(equalTo: titleTopicLbl.bottomAnchor, constant: 20).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}
