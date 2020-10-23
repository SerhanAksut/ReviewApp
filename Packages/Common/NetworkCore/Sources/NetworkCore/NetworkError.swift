//
//  File.swift
//  
//
//  Created by Serhan Aksut on 23.10.2020.
//

import Foundation

public enum NetworkError: Error {
    case url(Error)
    case decoding(Error)
    case apiError(String)
    case unauthorized
    case noConnection
    case unknown
    
    public var message: String? {
        switch self {
        case .url, .decoding, .unknown:
            return Constants.standardMessage
        case .apiError(let message):
            return message
        case .unauthorized:
            return nil
        case .noConnection:
            return Constants.noConnection
        }
    }
}

// MARK: - Constants
private enum Constants {
    static let standardMessage = "An error occured. Please try again."
    static let noConnection = "Please check your internet connection and try again."
}
