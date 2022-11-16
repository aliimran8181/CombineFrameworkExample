//
//  RyobiError.swift
//  Ryobi
//
//  Created by Washaq Majeed on 5/15/22.
//

enum AppError: Error, Hashable {
    case serverError(code: Int, message: String)
    case unauthorized
    case unexpectedResponse
    case unknown
    case connectivity
    
    init(message: String) {
        self = AppError.serverError(code: 0, message: message)
    }
}

extension AppError: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .serverError(_, let message):
            return message
        case .unauthorized:
            return "Validation Failed"
        case .unexpectedResponse:
            return "Unexpected Response"
        case .unknown:
            return "The operation could not be completed. Please try again later."
        case .connectivity:
            return "Internet Connection not Available!"
        }
    }
}
