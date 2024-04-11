//
//  CustomTextView.swift
//  MicroLoansApp
//
//  Created by Дмитрий Пономарев on 29.01.2024.
//

import UIKit

class CustomTextView: UITextView {
        
    func setupTextView(placeholder: String) {
        self.textColor = .customBlue
        self.font = .systemFont(ofSize: 25, weight: .medium)
        self.textContainerInset = UIEdgeInsets(top: 20, left: 30, bottom: 0, right: 10)
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.customBlue,
            .font: UIFont.systemFont(ofSize: 14, weight: .medium)
        ]
        self.attributedText = NSAttributedString(string: placeholder, attributes: placeholderAttributes)
        
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: self.bounds.height))
        self.addSubview(leftPaddingView)
        
        self.textContainer.lineFragmentPadding = 0
        
    }
}
