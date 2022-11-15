//
//  UserModel.swift
//  CombineFrameWorkTest
//
//  Created by Ali imran on 11/14/22.
//

import Foundation

struct UserModel: Decodable, Hashable {
    
    let id: Int?
    let name: String?
    let email: String?
    let phone: String?
}
