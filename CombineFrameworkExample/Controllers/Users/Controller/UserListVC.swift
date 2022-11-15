//
//  UserListVC.swift
//  CombineAlamofire
//
//  Created by Ali imran on 11/15/22.
//

import UIKit
import Combine

class UserListVC: UIViewController {
    private var userViewModel = UserViewModel()
    var userData = [UserModel]()
    private var cancellables = Set<AnyCancellable>()
    var url = "https://jsonplaceholder.typicode.com/users"
    var bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initialization()
    }
    
    @IBAction func btnUrlChange(_ sender: Any) {
        if bool == false {
            url = "https://jsonplaceholder.typicode.com/users"
            self.initialization()
            bool = true
            print(bool)
        } else {
            url = "https://jsonplaceholder."
            self.initialization()
            bool = false
            print(bool)
        }
    }
}
extension UserListVC {
    
    fileprivate func initialization() {
        
        self.title = "User List"
        userViewModel.getData([:], url: url)
            .sink { completion in
                    switch completion {
                    case .failure(let err):
                        print("Error is \(err.localizedDescription)")
                    case .finished:
                        print("Finished")
                    }
            }
            receiveValue: { [weak self] User in
                self?.setData(users: User)
    }
            .store(in: &cancellables)
    }
}
extension UserListVC {
    func setData(users: [UserModel]) {
        print(users)
    }
}
