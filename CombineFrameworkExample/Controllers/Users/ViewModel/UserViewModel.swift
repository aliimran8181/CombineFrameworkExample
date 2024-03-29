//
//  UserViewModel.swift
//  CombineAlamofire
//
//  Created by Ali imran on 11/15/22.
//

import Foundation
import Combine
import Alamofire

protocol UserViewModelProtocol {
    func getData(_ parameters: [String: String]) -> Future<[UserModel], Error>
}
class UserViewModel: UserViewModelProtocol, ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    var userData = [UserModel]()
    private let service: UserServiceProtocol
    
    init(service: UserServiceProtocol) {
        self.service = service
    }
    
    func getData(_ parameters: [String: String]) -> Future<[UserModel], Error>  {
        return Future ({ promise in
            
            self.service.getData([:])
            
                .sink { completion in
                    switch completion {
                    case .failure(let err):
                        promise (.failure(err))
                        print("Error is \(err.localizedDescription)")
                    case .finished:
                        print("Finished")
                    }
                }
        receiveValue: { [weak self] User in
            promise (.success(User))
            self?.userData = User
        }
        .store(in: &self.cancellables)
        })
    }
}
