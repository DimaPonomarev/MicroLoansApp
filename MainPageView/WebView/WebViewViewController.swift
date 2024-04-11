//
//  WebViewViewController.swift
//  MicroLoansApp
//
//  Created by Дмитрий Пономарев on 26.01.2024.
//


import UIKit
import WebKit
import Network


class WebViewViewController: UIViewController {


    //  MARK: - UI properties
    
    private let webView = WKWebView()
    private let buttonBack = UIButton()
    private var networkCheck = NetworkCheck.sharedInstance()

    
    //  MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
        
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    private func setup() {
        addViews()
        setupViews()
        makeConstraints()
        checkConnectionStatus()
    }
    
    private func addViews() {
        view.addSubview(buttonBack)
        view.addSubview(webView)
    }
    
    private func setupViews() {
        self.view.backgroundColor = .white
        buttonBack.setTitle("ЗАКРЫТЬ", for: .normal)
        buttonBack.setTitleColor(.customBlue, for: .normal)
        buttonBack.titleLabel?.font = .systemFont(ofSize: 12, weight: .heavy)
        buttonBack.addTarget(self, action: #selector(showMainPage), for: .touchUpInside)
        makeAttributeString(label: buttonBack.titleLabel ?? UILabel())
    }
    
    private func makeConstraints() {
        buttonBack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview()
        }
        webView.snp.makeConstraints { make in
            make.top.equalTo(buttonBack.snp.bottom).offset(16)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    private func makeAttributeString(label: UILabel) {
        let underlineAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.underlineColor: UIColor.customBlue,
            NSAttributedString.Key.baselineOffset: 2
        ]
        
        let attributedText = NSAttributedString(string: label.text ?? "", attributes: underlineAttributes)
        label.attributedText = attributedText
    }
    
    @objc private func showMainPage() {
        navigationController?.popViewController(animated: true)
    }
    
//    MARK: - Check InternetConnection
    
    private func checkConnectionStatus() {
        if networkCheck.currentStatus == .satisfied{
            loadWebView()
        }else{
            showAlert()
        }
        networkCheck.addObserver(observer: self)
    }
    
    private func loadWebView() {
        webView.configuration.defaultWebpagePreferences.allowsContentJavaScript = true
        guard let url = URL(string: "https://microzaymi-nakartu.online/?sub_id_1=956") else { return }
        webView.load(URLRequest(url: url))
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Проверьте интернет соединение", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension WebViewViewController: NetworkCheckObserver {
    
    func statusDidChange(status: NWPath.Status) {
        if status == .satisfied {
            loadWebView()
        } else if status == .unsatisfied {
            showAlert()
        }
    }
}
