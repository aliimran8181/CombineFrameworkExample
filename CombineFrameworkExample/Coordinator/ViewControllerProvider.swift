//
//  ViewControllerProvider.swift
//  CombineFrameworkExample
//
//  Created by Ali Zaib on 16/11/2022.
//

import Foundation
import UIKit

enum ViewControllerProvider {
    static var firstViewController: UserListVC {
//        let service: MoviesServicing
//        switch appConfiguration {
//        case .live:
//            service = Service()
//        case .mock:
//            service = MockService()
//        }
        let network = CoreNetworking()
        let service = UserService(network: network)
        let viewModel = UserViewModel(service: service)
        let viewController = UserListVC.loadFromStoryboard(storyboard: "Main")
        viewController.viewModel = viewModel
        return viewController
    }

//    static func movieDetailsController(for movie: Movie) -> MovieDetailsViewController {
//        let service: MovieDetailsServicing
//        switch appConfiguration {
//        case .live:
//            service = MovieDetailsService()
//        case .mock:
//            service = MovieDetailsMockService()
//        }
//        let viewModel = MovieDetailsViewModel(movie: movie,service: service)
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetails") as! MovieDetailsViewController
//        viewController.viewModel = viewModel
//        return viewController
//    }
}
