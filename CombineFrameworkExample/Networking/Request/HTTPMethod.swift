//
//  HTTPMethod.swift
//  Ryobi
//
//  Created by Washaq Majeed on 5/15/22.
//

typealias HTTPHeaders = [String: String]
typealias Parameters = [String: Any]

enum HTTPMethod {
    case get
    case post
    case put
    case patch
    case delete
}
