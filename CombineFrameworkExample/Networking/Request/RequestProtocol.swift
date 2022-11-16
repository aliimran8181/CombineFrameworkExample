//
//  RequestProtocol.swift
//  Ryobi
//
//  Created by Washaq Majeed on 5/15/22.
//

protocol RequestProtocol {
    associatedtype Response: Decodable
    associatedtype ErrorType: Error
    
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var headers: HTTPHeaders? { get }
    func baseURL(for environment: Environment) -> String
}

extension RequestProtocol {
    var headers: HTTPHeaders? { nil }
    func baseURL(for environment: Environment) -> String {
        switch environment {
            // TODO: just example replace it with proper url when done
        case .staging:
            return "http://34.242.55.145"
        case .production:
            return "https://swapi.dev"
        }
    }
}
