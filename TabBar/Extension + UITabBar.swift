//
//  Extension + UITabBar.swift
//  MicroLoansApp
//
//  Created by Дмитрий Пономарев on 26.01.2024.
//

import UIKit
import SnapKit

extension UITabBarItem {
    
    func setupTabBarItem(imageSelected: ImageResource, imageDeselected: ImageResource, text: String) -> UITabBarItem {
        
        let inactiveIconImage = UIImage(resource: imageDeselected).withRenderingMode(.alwaysOriginal)
        let activeIconImage = UIImage(resource: imageSelected).withRenderingMode(.alwaysOriginal)

        let resizedInactiveIcon = inactiveIconImage.preparingThumbnail(of: CGSize.init(width: 35, height: 35))
        let resizedActiveIcon = activeIconImage.preparingThumbnail(of: CGSize.init(width: 35, height: 35))

        let productsTabBarItem = UITabBarItem(
            title: nil,
            image: resizedInactiveIcon,
            selectedImage: resizedActiveIcon
        )
        
        productsTabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 16, weight: .semibold), .foregroundColor: UIColor.blue], for: .normal)
        productsTabBarItem.image?.withTintColor(.black, renderingMode: .alwaysTemplate)
        return productsTabBarItem
    }
}
