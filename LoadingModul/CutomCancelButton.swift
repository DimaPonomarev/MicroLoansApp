//
//  CutomCancelButton.swift
//  MicroLoansApp
//
//  Created by Дмитрий Пономарев on 26.01.2024.
//

import UIKit

class CutomCancelButton: UIButton {
    
    private let customImageView = UIImageView()
    private let customLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCancelButton() {
        addViews()
        setupCancelViews()
        setupCancelConstraints()
    }
    
    func setupNextButton() {
        addViews()
        setupNextViews()
        setupNextConstraints()
    }
//    MARK: - private funcs
    
    private func addViews() {
        self.addSubview(customImageView)
        self.addSubview(customLabel)
    }

//    MARK: - setupCancelViews
    
    private func setupCancelViews() {
        customImageView.image = .cancel
        customImageView.contentMode = .scaleAspectFit
        customLabel.font = .systemFont(ofSize: 18)
        customLabel.text = "пропустить"
        customLabel.textColor = .blue
    }
    
    private func setupCancelConstraints() {
        customImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(20)
            make.height.equalTo(customImageView.snp.width).multipliedBy(2)
        }
        customLabel.snp.makeConstraints { make in
            make.left.equalTo(customImageView.snp.right).offset(8)
            make.right.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    //    MARK: - setupNextViews

    private func setupNextViews() {
        customImageView.image = .next
        customLabel.text = "дальше"
        customLabel.font = .systemFont(ofSize: 18)
        customLabel.textColor = .blue
    }

    private func setupNextConstraints() {
        customLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        customImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(customLabel.snp.right).offset(8)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview()
            make.width.equalTo(20)
            make.height.equalTo(customImageView.snp.width).multipliedBy(2)
        }
    }
    
}
