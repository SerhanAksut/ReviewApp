//
//  File.swift
//  
//
//  Created by Serhan Aksut on 23.10.2020.
//

import Foundation

public enum NetworkError: Error {
    case url(Error)
    case noConnection
}
