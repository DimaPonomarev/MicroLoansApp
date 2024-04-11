//
//  TabBarViewController.swift
//  MicroLoansApp
//
//  Created by Дмитрий Пономарев on 26.01.2024.
//

import UIKit
import SnapKit

final class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    //  MARK: External dependencies
    
    weak var tabBarDelegate: UITabBarDelegate?
    
    //  MARK: - life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupGreenRound()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.selectedIndex = 1
    }
}

//  MARK: - private methods

private extension TabBarViewController {
    
    //  MARK: - setup UI
    
    func setupUI() {
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .black
        tabBar.backgroundColor = .white
        self.delegate = self
        self.tabBarDelegate = self
        self.tabBar.itemPositioning = .centered
        self.tabBar.itemSpacing = 1
    }
    
    func setupGreenRound() {
        let positionOnX: CGFloat = 90
        let positionOnY: CGFloat = 10
        let offSetFromBottom: CGFloat = 14
        let numberOfItems: CGFloat = 3
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height - offSetFromBottom),
            cornerRadius: height / 2
        )

        roundLayer.path = bezierPath.cgPath
        roundLayer.strokeColor = UIColor.systemGreen.cgColor
        roundLayer.lineWidth = 5
        roundLayer.fillColor = UIColor.clear.cgColor
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.layer.masksToBounds = false
        tabBar.itemWidth = width / numberOfItems
        tabBar.itemPositioning = .centered
    }
}
