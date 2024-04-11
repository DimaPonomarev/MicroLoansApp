//
//  ScreenFactory.swift
//  MicroLoansApp
//
//  Created by Дмитрий Пономарев on 23.01.2024.
//

import UIKit

protocol LoadingFactoryProtocol {
    func createLoadingScreen(coordinator: LoadingOutput) -> LoadingPageViewController
    func createFirstScreen(coordinator: LoadingOutput) -> FirstViewController
    func createSecondScreen(coordinator: LoadingOutput) -> SecondViewController
    func createThirdScreen(coordinator: LoadingOutput) -> ThirdViewController
}

protocol MainPageFactoryProtocol {
    func getMainPageViewController(userData: UserData?) -> MainPageViewController
    func showMainScreen(_ userData: UserData) -> UIViewController
}

class ScreenFactory {
    
    private var rootViewControll: UIViewController?
    
}

//  MARK: - extension FactoryLoadingProtocol

extension ScreenFactory: LoadingFactoryProtocol {
    
    func createLoadingScreen(coordinator: LoadingOutput) -> LoadingPageViewController {
        let loadingPresenter = LoadingPagePresenter(coordinator: coordinator)
        let loadingVC = LoadingPageViewController(presenter: loadingPresenter)
        loadingPresenter.controller = loadingVC
        
        return loadingVC
    }
    
    func createFirstScreen(coordinator: LoadingOutput) -> FirstViewController{
        let firstVC = FirstViewController()
        firstVC.coordinator = coordinator
        
        return firstVC
    }
    
    func createSecondScreen(coordinator: LoadingOutput) -> SecondViewController {
        let secondVC = SecondViewController()
        secondVC.coordinator = coordinator
        
        return secondVC
    }
    
    func createThirdScreen(coordinator: LoadingOutput) -> ThirdViewController {
        let thirdVC = ThirdViewController()
        thirdVC.coordinator = coordinator
        
        return thirdVC
    }
}

//  MARK: - extension MainPageFactoryProtocol

extension ScreenFactory: MainPageFactoryProtocol {
    
    func getMainPageViewController(userData: UserData?) -> MainPageViewController {
        let mainPageViewController = MainPageViewController()
        rootViewControll = mainPageViewController
        mainPageViewController.tabBarItem = UITabBarItem().setupTabBarItem(imageSelected: .mainPageSelected, imageDeselected: .mainPageDeselected, text: "Main")

        return mainPageViewController
    }
    
    func showMainScreen(_ userData: UserData) -> UIViewController {
        guard let vc = rootViewControll as? MainPageViewController else { return UIViewController()}
        
        return vc
    }
    
}
