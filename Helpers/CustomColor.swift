//
//  CustomColor.swift
//  MicroLoansApp
//
//  Created by Дмитрий Пономарев on 27.01.2024.
//

import UIKit

extension UIColor {
    convenience init(newRed: Int, green: Int, blue: Int) {
        let newRed = CGFloat(newRed)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
    static let customBlue = UIColor(newRed: 60, green: 93, blue: 190)
}
