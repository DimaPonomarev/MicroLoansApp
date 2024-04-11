
//
//  TermsOfUsePageViewController.swift
//  MicroLoansApp
//
//  Created by Дмитрий Пономарев on 26.01.2024.
//


import UIKit

final class PrivacyPolicyPageViewController: UIViewController {
    
    //  MARK: - UI properties
    
    private let titleLabel = UILabel()
    private let descriptionTextField = CustomTextView()
    private let buttonBack = UIButton()
    private let logoImageView = UIImageView()
    
    
    //  MARK: - life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

//  MARK: - private methods

private extension PrivacyPolicyPageViewController {
    
    //  MARK: - setup UI
    
    func setup() {
        addViews()
        setupViews()
        setupConstraints()
    }
    
    func addViews() {
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionTextField)
        view.addSubview(buttonBack)
    }
    
    func setupViews() {
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true

        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = .logo
        
        titleLabel.text = "ПОЛИТИКА КОНФИДЕНЦИАЛЬНОСТИ"
        titleLabel.textColor = .customBlue
        titleLabel.font = .systemFont(ofSize: 16, weight: .black)
        titleLabel.textAlignment = .center
        makeAttributeString(label: titleLabel)
        
        descriptionTextField.setupTextView(placeholder: .privacyPolicyText)
        
        buttonBack.setTitle("ЗАКРЫТЬ", for: .normal)
        buttonBack.setTitleColor(.customBlue, for: .normal)
        buttonBack.titleLabel?.font = .systemFont(ofSize: 12, weight: .heavy)
        buttonBack.addTarget(self, action: #selector(showMainPage), for: .touchUpInside)
        makeAttributeString(label: buttonBack.titleLabel ?? UILabel())
    }
    
    func setupConstraints() {
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.layoutMarginsGuide)
            make.left.right.equalToSuperview().inset(50)
            make.height.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(8)
            make.centerX.width.equalToSuperview()
        }
        descriptionTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(buttonBack.snp.top).inset(-10)
        }
        buttonBack.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(60)
            make.width.equalTo(200)
        }
    }
    
    //  MARK: - private methods
    
    private func makeAttributeString(label: UILabel) {
        let underlineAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.underlineColor: UIColor.customBlue,
            NSAttributedString.Key.baselineOffset: 2
        ]
        
        let attributedText = NSAttributedString(string: label.text ?? "", attributes: underlineAttributes)
        label.attributedText = attributedText
    }
    
    //  MARK: - objc method
    
    @objc func showMainPage() {
        navigationController?.popViewController(animated: true)
    }
}
