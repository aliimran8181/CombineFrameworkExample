//
//  CoreService.swift
//  CombineAlamofire
//
//  Created by Ali imran on 11/15/22.
//

import Foundation
import Combine
import Alamofire

struct CoreService {
        static func request<T: Decodable>(
            url: String,
            method: HTTPMethod,
            parameters: Parameters?,
            decoder: JSONDecoder = JSONDecoder(),
            headers: HTTPHeaders? = nil,
            responseModel: T,
            encoding: ParameterEncoding = URLEncoding.default
        ) -> Future<T, Error> {
            return Future({ promise in
                AF.request(
                    url,
                    method: method,
                    parameters: parameters,
                    encoding: encoding,
                    headers: headers
                ).responseDecodable(decoder: decoder, completionHandler: { (response: DataResponse<T, AFError>) in
                    switch response.result {
                        case .success(let value):
                            promise(.success(value))
                        case .failure(let error):
                            promise(.failure(error)
                        )
                    }
                })
            })
        }
    }
