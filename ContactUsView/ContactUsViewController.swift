//
//  ContactUsViewController.swift
//  MicroLoansApp
//
//  Created by Дмитрий Пономарев on 26.01.2024.
//

import UIKit
import MessageUI

final class ContactUsViewController: UIViewController {
    
    //  MARK: - UI properties
    
    private let logoImageView = UIImageView()
    private let supportServiceLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let sendMessageButton = UIButton()
    
    //  MARK: - life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sendMessageButton.layer.cornerRadius = sendMessageButton.bounds.height / 2
    }
}

//  MARK: - private methods

private extension ContactUsViewController {
    
    //  MARK: - setup UI
    
    func setup() {
        addViews()
        setupViews()
        setupConstraints()
        addActions()
    }
    
    func addViews() {
        view.addSubview(logoImageView)
        view.addSubview(supportServiceLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(sendMessageButton)
    }
    
    func setupViews() {
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = .logo
        
        supportServiceLabel.text = "СЛУЖБА ПОДДЕРЖКИ"
        supportServiceLabel.textAlignment = .center
        supportServiceLabel.textColor = UIColor.customBlue
        supportServiceLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        supportServiceLabel.minimumScaleFactor = 0.5
        supportServiceLabel.adjustsFontSizeToFitWidth = true
        makeAttributeString(label: supportServiceLabel)
        
        descriptionLabel.text = "Отправьте нам свой вопрос на почту и мы обязательно вам ответим!"
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = UIColor.customBlue
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.minimumScaleFactor = 0.5
        descriptionLabel.adjustsFontSizeToFitWidth = true
        
        sendMessageButton.setTitle("micro-zaimy@mail.ru", for: .normal)
        sendMessageButton.setTitleColor(.customBlue, for: .normal)
        sendMessageButton.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)

        sendMessageButton.clipsToBounds = true
        sendMessageButton.layer.borderColor = UIColor.systemGreen.cgColor
        sendMessageButton.layer.borderWidth = 5
        sendMessageButton.addTarget(self, action: #selector(onSendButtonTapped), for: .touchUpInside)
        makeAttributeString(label: sendMessageButton.titleLabel ?? UILabel())
    }
    
    func setupConstraints() {
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.layoutMarginsGuide)
            make.left.right.equalToSuperview().inset(50)
            make.height.equalTo(100)
        }
        
        supportServiceLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.5)
            make.bottom.equalTo(descriptionLabel.snp.top)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.bottom.equalTo(sendMessageButton.snp.top).offset(-20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.5)
        }
        
        sendMessageButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(sendMessageButton.intrinsicContentSize.width + 40)
            make.height.equalTo(sendMessageButton.intrinsicContentSize.height + 20)
        }
    }
    private func makeAttributeString(label: UILabel) {
        let underlineAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.underlineColor: UIColor.customBlue,
            NSAttributedString.Key.baselineOffset: 7
        ]
        
        let attributedText = NSAttributedString(string: label.text ?? "", attributes: underlineAttributes)
        label.attributedText = attributedText
    }
    
    //  MARK: - addActions
    
    func addActions() {
    }
    
    //  MARK: - private methods
    
    private func configureMailComposer() -> MFMailComposeViewController{
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients(["micro-zaimy@mail.ru"])
        return mailComposeVC
    }
    
    //  MARK: - objc method
    
    @objc func onSendButtonTapped() {
        let composer = configureMailComposer()
        if MFMailComposeViewController.canSendMail() {
            self.present(composer, animated: true, completion: nil)
        }
    }
}

//  MARK: - extension MFMailComposeViewControllerDelegate

extension ContactUsViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        self.dismiss(animated: true)
    }
}

