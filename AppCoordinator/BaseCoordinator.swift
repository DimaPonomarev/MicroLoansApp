//
//  BaseCoordinator.swift
//  MicroLoansApp
//
//  Created by Дмитрий Пономарев on 23.01.2024.
//

import Foundation

class BaseCoordinator {
    
    let router: Router
    
    var childCoordinators = [BaseCoordinator]()
    
    init(router: Router) {
        self.router = router
    }
    
    func addDependency(_ coordinator: BaseCoordinator) {
        for element in childCoordinators where element === coordinator {
            return
        }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: BaseCoordinator) {
        childCoordinators.removeAll(where: { $0 === coordinator })
    }
}
