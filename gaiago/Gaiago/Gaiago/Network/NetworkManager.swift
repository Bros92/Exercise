//
//  GaiagoApp.swift
//  Gaiago
//
//  Created by Vincenzo Broscritto on 09/10/2020.
//

import Alamofire
import Combine
import Foundation

internal class NetworkManager {
    
    /// Shared initializer
    internal static var shared = NetworkManager()
    
    internal func doRequest(method: HTTPMethod, url: String, body: [String: Any]? = nil, encodingType: EncodingType, jsonBody: Bool) -> AnyPublisher<Data, NetworkError> {
        
        do {
            let request = try URLRequest(url: url, method: method)
            var alamofireRequest = try encodingType == .appJson ? JSONEncoding().encode(request, with: body) : URLEncoding().encode(request, with: body)
            alamofireRequest.setValue(encodingType.rawValue, forHTTPHeaderField: "Content-Type")
            alamofireRequest.timeoutInterval = 30
            return callApi(request: alamofireRequest)
        } catch {
            let networkError = NetworkError(statusCode: nil, code: "Generic Error", message: "Wrong url request")
            return Fail(error: networkError).eraseToAnyPublisher()
        }
    }
    
    private func callApi(request: URLRequest) -> AnyPublisher<Data, NetworkError> {
        AF.request(request)
            .validate(statusCode: 200..<400)
            .response(completionHandler: { (data) in
                debugPrint(data)
            })
            .publishData()
            .value()
            .mapError { _ in NetworkError(statusCode: nil, code: "Attenzione!", message: "Si è verificato un errore") }
            .eraseToAnyPublisher()
    }
}
