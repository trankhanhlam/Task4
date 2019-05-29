import UIKit

class WebViewController: BaseViewController, UIWebViewDelegate {
    let toolbarHeight: CGFloat = 64
    let url: String = "https://www.google.com/"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white        
        let targetUrl = URL(string: url)
        
        // init toolbar
        let toolbarView = UIToolbar()
        toolbarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toolbarView)
        toolbarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        toolbarView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        toolbarView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        toolbarView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        toolbarView.setItems([UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(close))],
                             animated: true)
        
        // init web-view
        let webView = UIWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.frame = CGRect(x: 0,
                               y: toolbarHeight,
                               width: view.frame.width,
                               height: view.frame.height - toolbarHeight)
        
        webView.loadRequest(URLRequest(url: targetUrl!))
        webView.delegate = self
        view.addSubview(webView)
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("Error occurred while page loading: \(error)")
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("Page loaded successfully")
    }
    
    @objc func close() {
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
}

