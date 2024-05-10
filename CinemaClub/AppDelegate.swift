//
//  AppDelegate.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 10.05.2024.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
