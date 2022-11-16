//
//  Coordinator.swift
//  CombineFrameworkExample
//
//  Created by Ali Zaib on 16/11/2022.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
