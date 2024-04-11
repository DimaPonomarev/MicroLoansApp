//
//  LoadingPagePresenter.swift
//  MicroLoansApp
//
//  Created by Дмитрий Пономарев on 23.01.2024.
//


import Foundation

protocol LoadingPagePresenterProtocol: AnyObject {
    var controller: LoadingPageDisplayLogic? { get set }
    func progressHasBeenCompleted()
}

class LoadingPagePresenter {
    
    //  MARK: - External properties
    
    weak var controller: LoadingPageDisplayLogic?
    
    //  MARK: Data Variables
    
    
    // MARK: Private Variables
    
    private weak var coordinator: LoadingOutput?
    
    //  MARK: - Init
    
    init(coordinator: LoadingOutput) {
        self.coordinator = coordinator
    }
    
    //  MARK: - Delegate methodes
    
    
    
    //  MARK: - Private Methods
    
}

//  MARK: - extension LoadingPagePresenterProtocol

extension LoadingPagePresenter: LoadingPagePresenterProtocol {
    func progressHasBeenCompleted() {
        coordinator?.showFirstScreen()
    }
}
