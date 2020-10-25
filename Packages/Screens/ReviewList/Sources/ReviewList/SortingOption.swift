//
//  File.swift
//  
//
//  Created by Serhan Aksut on 25.10.2020.
//

import Foundation

enum SortingOption: Int, CaseIterable {
    case helpful
    case favourable
    case critical
    
    var title: String {
        switch self {
        case .helpful:
            return Constants.helpful
        case .favourable:
            return Constants.favourable
        case .critical:
            return Constants.critical
        }
    }
}

// MARK: - Constants
private enum Constants {
    static let helpful = ""
    static let favourable = ""
    static let critical = ""
}
