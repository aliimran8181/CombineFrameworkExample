//
//  UserService.swift
//  CombineFrameworkExample
//
//  Created by Ali Zaib on 16/11/2022.
//

import Foundation
import Combine

protocol UserServiceProtocol {
    func getData(_ parameters: [String: String]) -> Future<[UserModel], Error>
}

class UserService: UserServiceProtocol {
    
    private var cancellables = Set<AnyCancellable>()
    let network: CoreNetworkingProtocol
    init(network: CoreNetworkingProtocol) {
        self.network = network
    }
    
    func getData(_ parameters: [String: String]) -> Future<[UserModel], Error>  {
        let request = UserRequest()
        return Future ({ promise in
            
            self.network.request(request)
                .sink { completion in
                    switch completion {
                    case .failure(let err):
                        promise (.failure(err))
                        print("Error is \(err.localizedDescription)")
                    case .finished:
                        print("Finished")
                    }
                }
        receiveValue: { User in
            
            promise (.success(User))
        }
        .store(in: &self.cancellables)
        })
        
    }
}
