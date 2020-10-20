//
//  GaiagoApp.swift
//  Gaiago
//
//  Created by Vincenzo Broscritto on 09/10/2020.
//

import Foundation

internal class NetworkError: Error {
    
    /// Error status code
    internal var statusCode: Int?
    /// Error code
    internal var code: String?
    /// Error message
    internal var message: String?
    
    internal init(statusCode: Int?, code: String?, message: String?) {
        self.statusCode = statusCode
        self.code = code
        self.message = message
    }
}
