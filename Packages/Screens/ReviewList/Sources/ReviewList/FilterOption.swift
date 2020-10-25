//
//  File.swift
//  
//
//  Created by Serhan Aksut on 25.10.2020.
//

import Foundation

enum FilterOption: Int, CaseIterable {
    case veryBad
    case bad
    case allRight
    case good
    case veryGood
    case noFilter
    
    var title: String {
        switch self {
        case .veryBad:
            return Constants.veryBad
        case .bad:
            return Constants.bad
        case .allRight:
            return Constants.allRight
        case .good:
            return Constants.good
        case .veryGood:
            return Constants.veryGood
        case .noFilter:
            return Constants.noFilter
        }
    }
    
    var starCount: Int? {
        if case .noFilter = self {
            return nil
        }
        return rawValue + 1
    }
}

// MARK: - Constants
private enum Constants {
    static let veryBad = "1 Star"
    static let bad = "2 Stars"
    static let allRight = "3 Stars"
    static let good = "4 Stars"
    static let veryGood = "5 Stars"
    static let noFilter = "Default"
}
