//
//  TabBarCoordinators.swift
//  MicroLoansApp
//
//  Created by Дмитрий Пономарев on 30.01.2024.
//


import UIKit

final class TabBarCoordinator: BaseCoordinator {
    
    var onFinish: (() -> Void)?
    var userData: UserData?
    private lazy var tabBarViewController = getTabBarViewController()
    
    func start() {
        
        setTabBar()
        howItWorksScreen()
//        showMainScreen()
        make()
        contactUsScreen()
    }
    
    func make() {
        let contactUsVC = MainPageViewController()
        contactUsVC.tabBarItem = UITabBarItem().setupTabBarItem(imageSelected: .mainPageSelected, imageDeselected: .mainPageDeselected, text: "Contact")
        
        tabBarViewController.viewControllers?.append(contactUsVC)
    }

    
    func finish() {
        onFinish?()
    }
    
    private func setTabBar() {
        router.setViewControllers([tabBarViewController], isNavigationBarHidden: true)
    }
    
    private func howItWorksScreen() {
        let howItWorksVC = HowItWorksViewController()
        howItWorksVC.tabBarItem = UITabBarItem().setupTabBarItem(imageSelected: .howItWorksSelected, imageDeselected: .howItWorksDeselected, text: "How It works")
        
        tabBarViewController.viewControllers = [howItWorksVC]
    }
    
    private func contactUsScreen() {
        let contactUsVC = ContactUsViewController()
        contactUsVC.tabBarItem = UITabBarItem().setupTabBarItem(imageSelected: .contactUsSelected, imageDeselected: .contactUsDeselected, text: "Contact")

        tabBarViewController.viewControllers?.append(contactUsVC)
    }
}

private extension TabBarCoordinator {
    
    func getTabBarViewController() -> TabBarViewController {
        let tabBarViewController = TabBarViewController()
        
        return tabBarViewController
    }
}

