//
//  CinemaClubApp.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 01.05.2024.
//

import SwiftUI

@main
struct CinemaClubApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            PhoneInputView()
        }
    }
}
