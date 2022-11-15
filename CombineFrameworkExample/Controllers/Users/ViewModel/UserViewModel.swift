//
//  UserViewModel.swift
//  CombineAlamofire
//
//  Created by Ali imran on 11/15/22.
//

import Foundation
import Combine
import Alamofire

class UserViewModel: ObservableObject {

    private var cancellables = Set<AnyCancellable>()
    var userData = [UserModel]()
    
    func getData(_ parameters: [String: String] , url: String) -> Future<[UserModel], Error>  {
            let url = url
            return Future ({ promise in
                return CoreService.request(
                    url: url,
                    method: HTTPMethod.get,
                    parameters: parameters
                )
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
