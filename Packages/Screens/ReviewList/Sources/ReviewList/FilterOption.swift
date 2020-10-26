//
//  File.swift
//  
//
//  Created by Serhan Aksut on 25.10.2020.
//

import Foundation

/// Filter options for the review list according to star count.
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
    static let veryBad = "⭐️"
    static let bad = "⭐️⭐️"
    static let allRight = "⭐️⭐️⭐️"
    static let good = "⭐️⭐️⭐️⭐️"
    static let veryGood = "⭐️⭐️⭐️⭐️⭐️"
    static let noFilter = "Default"
}
