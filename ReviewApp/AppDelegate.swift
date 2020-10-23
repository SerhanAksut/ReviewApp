//
//  AppDelegate.swift
//  ReviewApp
//
//  Created by Serhan Aksut on 23.10.2020.
//

import ReviewList
import AppstoreAPILive
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        let viewModel = ReviewListViewModel(api: .live)
        
        return true
    }
}
