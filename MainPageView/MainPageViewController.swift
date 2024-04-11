//
//  MainPageViewController.swift
//  MicroLoansApp
//
//  Created by Дмитрий Пономарев on 26.01.2024.
//

import UIKit

protocol MainPageDisplayLogic: AnyObject {
    
}

final class MainPageViewController: UIViewController, MainPageDisplayLogic {
    
    //  MARK: External dependencies
        
    //  MARK: - UI properties
    
    private let logoImageView = UIImageView()
    private let roundedImageView = CustomRoundWithMessageView()
    private let protectionView = UIView()
    private let protectionMessage = UILabel()
    private let protectionImageView = UIImageView()
    private let getALoanButton = UIButton()
    private let termsToKnowLabel = UILabel()

    //  MARK: - init
    
    
    
    //  MARK: - life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        getALoanButton.layer.cornerRadius = getALoanButton.bounds.height / 2
    }
}

//  MARK: - private methods

private extension MainPageViewController {
    
    //  MARK: - setup UI
    
    func setup() {
        addViews()
        setupViews()
        setupConstraints()
        addActions()
    }
    
    func addViews() {
        view.addSubview(logoImageView)
        view.addSubview(roundedImageView)
        view.addSubview(protectionView)
        protectionView.addSubview(protectionImageView)
        protectionView.addSubview(protectionMessage)
        view.addSubview(getALoanButton)
        view.addSubview(termsToKnowLabel)
    }
    
    func setupViews() {
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true

        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = .logo
        
        protectionImageView.image = .protection
        protectionImageView.contentMode = .scaleAspectFit
        
        
        protectionMessage.text = "Ваши данные защищены"
        protectionMessage.font = .systemFont(ofSize: 12)
        protectionMessage.textAlignment = .center
        protectionMessage.textColor = UIColor.customBlue
        protectionMessage.minimumScaleFactor = 0.7
        protectionMessage.adjustsFontSizeToFitWidth = true
        getALoanButton.setTitle("ПОЛУЧИТЬ ДЕНЬГИ", for: .normal)
        getALoanButton.titleLabel?.font = .systemFont(ofSize: 24, weight: .heavy)
        getALoanButton.backgroundColor = .systemGreen
        getALoanButton.clipsToBounds = true
        getALoanButton.layer.borderColor = UIColor.customBlue.cgColor
        getALoanButton.layer.borderWidth = 5
        getALoanButton.titleLabel?.minimumScaleFactor = 0.1
        getALoanButton.titleLabel?.adjustsFontSizeToFitWidth = true
        getALoanButton.addTarget(self, action: #selector(tapToShowWebView), for: .touchDown)
        
        
        termsToKnowLabel.text = "Перед использованием приложения ознакомьтесь с политикой конфиденциальности и условиями кредитования"
        termsToKnowLabel.font = .systemFont(ofSize: 12)
        termsToKnowLabel.numberOfLines = 0
        termsToKnowLabel.textAlignment = .center
        termsToKnowLabel.textColor = UIColor.customBlue

        
        let attributedText = NSMutableAttributedString(string: termsToKnowLabel.text ?? "")

        let privacyPolicyRange = (attributedText.string as NSString).range(of: "политикой конфиденциальности")
        let termsAndConditionsRange = (attributedText.string as NSString).range(of: "условиями кредитования")
        attributedText.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: privacyPolicyRange)
        attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 11), range: privacyPolicyRange)
        attributedText.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: termsAndConditionsRange)
        attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 11), range: termsAndConditionsRange)

        termsToKnowLabel.attributedText = attributedText

        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapLabel(_:)))
        self.termsToKnowLabel.addGestureRecognizer(tap)
        self.termsToKnowLabel.isUserInteractionEnabled = true

    }
    
    func setupConstraints() {
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30).priority(.low)
            make.top.equalTo(view.layoutMarginsGuide).priority(.high)
            make.left.right.equalToSuperview().inset(50)
            make.height.equalTo(100)
        }
        roundedImageView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(8)
            make.width.equalToSuperview().inset(35)
            make.height.equalTo(roundedImageView.snp.width)
            make.centerX.equalToSuperview()
        }
        protectionView.snp.makeConstraints { make in
            make.top.equalTo(roundedImageView.snp.bottom).offset(8)
            make.width.lessThanOrEqualTo(roundedImageView)
            make.centerX.equalToSuperview()
            make.height.equalTo(protectionMessage.intrinsicContentSize.height)
        }
        protectionMessage.snp.makeConstraints { make in
            make.right.top.bottom.equalToSuperview()
            make.left.equalTo(protectionImageView.snp.right).offset(4)
        }
        protectionImageView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.bottom.equalTo(protectionMessage)
            make.width.equalTo(protectionImageView.snp.height)
        }
        getALoanButton.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(protectionView.snp.bottom).offset(4)
            make.top.lessThanOrEqualTo(protectionView.snp.bottom).offset(100)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().inset(40)
            make.height.equalTo(getALoanButton.intrinsicContentSize.height + 20)
            make.width.equalTo(getALoanButton.intrinsicContentSize.width + 20).priority(1)
            make.centerX.equalToSuperview()
        }
        termsToKnowLabel.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(getALoanButton.snp.bottom).offset(8)
            make.width.equalToSuperview().dividedBy(1.3)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
    
    //  MARK: - addActions
    
    func addActions() {
        
    }
    
    //  MARK: - objc method
    
    @objc func tapToShowWebView() {
        let viewController = WebViewViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func tapLabel(_ gesture: UITapGestureRecognizer) {
        guard let text = termsToKnowLabel.text else { return }

        let privacyPolicyRange = (text as NSString).range(of: "политикой конфиденциальности")
        let termsAndConditionsRange = (text as NSString).range(of: "условиями кредитования")

        if gesture.didTapAttributedTextInLabel(label: termsToKnowLabel, inRange: privacyPolicyRange) {
            let viewController = PrivacyPolicyPageViewController()
            navigationController?.pushViewController(viewController, animated: true)
        } else if gesture.didTapAttributedTextInLabel(label: termsToKnowLabel, inRange: termsAndConditionsRange) {
            let viewController = TermsOfUsePageViewController()
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
