//
//  LoadingCoordinator.swift
//  MicroLoansApp
//
//  Created by Дмитрий Пономарев on 23.01.2024.
//


import Foundation

protocol LoadingOutput: AnyObject {
    func showFirstScreen()
    func showSecondScreen()
    func showThirdScreen()
    func showMainScreen()
}

final class LoadingCoordinator: BaseCoordinator {
    
    var onFinish: (() -> Void)?
    
    var userData: UserData?
    var factoryLoading: LoadingFactoryProtocol!

    func start() {
        showLoadingScreen()
    }
    
    func finish() {
        onFinish?()
    }
}

extension LoadingCoordinator: LoadingOutput {
    
    func showLoadingScreen() {
        let loadingVC = factoryLoading.createLoadingScreen(coordinator: self)
        
        router.push(loadingVC)
    }
    
    func showFirstScreen() {
        let firstVC = factoryLoading.createFirstScreen(coordinator: self)
        
        router.push(firstVC)
    }
    
    func showSecondScreen() {
        let secondVC = factoryLoading.createSecondScreen(coordinator: self)

        router.push(secondVC)
    }
    
    func showThirdScreen() {
        let thirdVC = factoryLoading.createThirdScreen(coordinator: self)

        router.push(thirdVC)
    }
    
    func showMainScreen() {
        finish()
    }
}
