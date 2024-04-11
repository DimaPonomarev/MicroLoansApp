//
//  HowItWorksTableViewCell.swift
//  MicroLoansApp
//
//  Created by Дмитрий Пономарев on 29.01.2024.
//

import UIKit

class HowItWorksTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    //MARK: - UI properties
    
    private let howToGetALownLabel = UILabel()
    private let showDescriptionImageView = UIImageView()
    private let descriptionLabel = UILabel()
    
    //MARK: init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func configureView(_ model: ModelForCells) {
        howToGetALownLabel.text = model.title

        if model.isTapped {
            showDescriptionImageView.image = .show
            descriptionLabel.text = model.description
        } else {
            showDescriptionImageView.image = .hide
            descriptionLabel.text = nil
        }
    }
}

//MARK: - Private methods

private extension HowItWorksTableViewCell {
    
    //MARK: - Setup
        
    func setup() {
        addViews()
        setupViews()
        makeConstraints()
    }
    
    //MARK: - addViews
    
    func addViews() {
        contentView.addSubview(howToGetALownLabel)
        contentView.addSubview(showDescriptionImageView)
        contentView.addSubview(descriptionLabel)
    }
    
    //MARK: - makeConstraints
    
    func makeConstraints() {
        howToGetALownLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(20)
        }
        showDescriptionImageView.snp.makeConstraints { make in
            make.centerY.equalTo(howToGetALownLabel)
            make.height.equalTo(howToGetALownLabel.intrinsicContentSize.height + 16)
            make.width.equalTo(showDescriptionImageView.snp.height)
            make.left.greaterThanOrEqualTo(howToGetALownLabel.snp.right)
            make.right.equalToSuperview().inset(32)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(howToGetALownLabel.snp.bottom).offset(20)
            make.left.equalTo(howToGetALownLabel)
            make.right.equalTo(showDescriptionImageView)
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
    //MARK: - setupViews
    
    func setupViews() {
        howToGetALownLabel.text = "none"
        howToGetALownLabel.textColor = .customBlue
        howToGetALownLabel.font = .systemFont(ofSize: 16, weight: .black)
        howToGetALownLabel.textAlignment = .center
        makeAttributeString(label: howToGetALownLabel)
        
        showDescriptionImageView.contentMode = .scaleAspectFit

        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .customBlue
        descriptionLabel.font = .systemFont(ofSize: 12)
    }
    
    func makeAttributeString(label: UILabel) {
        let underlineAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.underlineColor: UIColor.customBlue,
            NSAttributedString.Key.baselineOffset: 2
        ]
        
        let attributedText = NSAttributedString(string: label.text ?? "", attributes: underlineAttributes)
        label.attributedText = attributedText
    }
}
