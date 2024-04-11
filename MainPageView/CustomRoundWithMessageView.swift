//
//  CustomRoundView.swift
//  MicroLoansApp
//
//  Created by Дмитрий Пономарев on 27.01.2024.
//

import UIKit

class CustomRoundWithMessageView: UIView {
    private let customBackgroundView = UIImageView()
    private let firstLoanLabel = UILabel()
    private let messageInsideRoundImageView = UIImageView()
    private let zeroPercentLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addViews()
        setupViews()
        makeConstraints()
    }
    
    func addViews() {
        self.addSubview(customBackgroundView)
        self.addSubview(firstLoanLabel)
        self.addSubview(messageInsideRoundImageView)
        self.addSubview(zeroPercentLabel)
    }
    
    func setupViews() {
        customBackgroundView.image = .round
        customBackgroundView.contentMode = .scaleAspectFit
        firstLoanLabel.text = "ПЕРВЫЙ ЗАЙМ"
        firstLoanLabel.font = .systemFont(ofSize: 60, weight: .heavy)
        firstLoanLabel.minimumScaleFactor = 0.1
        firstLoanLabel.adjustsFontSizeToFitWidth = true
        firstLoanLabel.textColor = .white
        messageInsideRoundImageView.image = .message
        messageInsideRoundImageView.contentMode = .scaleAspectFit
        zeroPercentLabel.text = "0%"
        zeroPercentLabel.font = .systemFont(ofSize: 80, weight: .heavy)
        zeroPercentLabel.minimumScaleFactor = 0.1
        zeroPercentLabel.adjustsFontSizeToFitWidth = true
        zeroPercentLabel.textColor = .white
    }
    
    func makeConstraints() {
        customBackgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
        firstLoanLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview().inset(60)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(messageInsideRoundImageView.snp.centerY)

        }
        messageInsideRoundImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
        }
        zeroPercentLabel.snp.makeConstraints { make in
            make.top.equalTo(messageInsideRoundImageView.snp.centerY)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
