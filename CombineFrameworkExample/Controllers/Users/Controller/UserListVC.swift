//
//  UserListVC.swift
//  CombineAlamofire
//
//  Created by Ali imran on 11/15/22.
//

import UIKit
import Combine

class UserListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var coordinator: MainCoordinator?
    var viewModel: UserViewModelProtocol!
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
        
        viewModel.getData([:])
            .sink { completion in
                switch completion {
                case .failure(let err):
                    self.userData = []
                    self.tableView.reloadData()
                    print("Error is \(err.localizedDescription)")
                case .finished:
                    self.tableView.reloadData()
                    print("Finished")
                }
            }
    receiveValue: { [weak self] User in
        self?.userData = User
    }
    .store(in: &cancellables)
    }
}
extension UserListVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserListTableViewCell
        cell.titleLabel.text = userData[indexPath.row].name ?? ""
        return cell
    }
}
