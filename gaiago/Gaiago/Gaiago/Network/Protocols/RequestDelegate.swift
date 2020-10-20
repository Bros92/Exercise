//
//  GaiagoApp.swift
//  Gaiago
//
//  Created by Vincenzo Broscritto on 09/10/2020.
//

import Alamofire
import Combine
import Foundation

internal protocol RequestDelegate: class {
    /// Create request and manage data using completion
    /// - Parameters:
    ///   - method: HTTP Method
    ///   - url: URL for request
    ///   - body: request body
    ///   - encodingType: can be json or url
    ///   - jsonBody: define if request has json body
    func request(method: HTTPMethod, url: String, body: [String: Any]?, encodingType: EncodingType, jsonBody: Bool) -> AnyPublisher<Data, NetworkError>
}

extension RequestDelegate {
    
    /// Wrapp ReqquestDelegateMethod
    internal func request(method: HTTPMethod, url: String, body: [String: Any]? = nil, encodingType: EncodingType, jsonBody: Bool) -> AnyPublisher<Data, NetworkError> {
        NetworkManager.shared.doRequest(method: method, url: url, body: body, encodingType: encodingType, jsonBody: jsonBody)
    }
}
