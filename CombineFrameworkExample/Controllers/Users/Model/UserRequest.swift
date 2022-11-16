//
//  UserRequest.swift
//  CombineFrameworkExample
//
//  Created by Ali Zaib on 16/11/2022.
//

import Foundation


struct UserRequest: RequestProtocol {
    
    
    typealias Response = [UserModel]
    typealias ErrorType = AppError
    var method: HTTPMethod = .get
    var path: String = "https://jsonplaceholder.typicode.com/users"
    var parameters: Parameters?
}
