//
//  CoreService.swift
//  CombineAlamofire
//
//  Created by Ali Zaib on 11/15/22.
//

import Foundation
import Combine
import Alamofire


protocol CoreNetworkingProtocol {
    func request<R: RequestProtocol>(_ resource: R)  -> Future<R.Response, ServiceError<R.ErrorType>>
}

final class CoreNetworking: CoreNetworkingProtocol {
    
    func request<R>(_ resource: R) -> Future<R.Response, ServiceError<R.ErrorType>> where R : RequestProtocol {
        var httpHeaders: Alamofire.HTTPHeaders?
        if let headers = resource.headers?.map({ Alamofire.HTTPHeader(name: $0.key, value: $0.value) }) {
            httpHeaders = Alamofire.HTTPHeaders(headers)
        }
        let path = resource.path //"\(resource.baseURL(for: .staging))\(resource.path)"
        let url = URL(string: path)!
        
        return Future({ promise in
            AF.request(url, method: resource.method.alamofireMethod, parameters: resource.parameters, encoding: JSONEncoding.default, headers: httpHeaders).validate(statusCode: 200 ... 401).responseDecodable(of: R.Response.self, completionHandler: { reponse in
                switch reponse.result {
                case .success(let response):
                    promise(.success(response))
                case .failure(let afError):
                    promise(.failure(ServiceError(error: afError.underlyingError.self)))
                }
                
            })
        })
    }
    
}
extension HTTPMethod {
    var alamofireMethod: Alamofire.HTTPMethod {
        switch self {
        case .get:
            return Alamofire.HTTPMethod.get
        case .post:
            return Alamofire.HTTPMethod.post
        case .put:
            return Alamofire.HTTPMethod.put
        case .patch:
            return Alamofire.HTTPMethod.patch
        case .delete:
            return Alamofire.HTTPMethod.delete
        }
    }
}
