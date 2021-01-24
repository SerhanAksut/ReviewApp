//
//  UIView+Extensions.swift
//  ReviewApp
//
//  Created by Serhan Aksut on 24.01.2021.
//

import UIKit

public protocol ViewIdentifier: class {
    static var identifier: String { get }
}

public extension ViewIdentifier {
    static var identifier: String {
        String(describing: self)
    }
}

extension UIView: ViewIdentifier {}
