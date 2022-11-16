//
//  MainCoordinator.swift
//  CombineFrameworkExample
//
//  Created by Ali Zaib on 16/11/2022.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = ViewControllerProvider.firstViewController
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
}
