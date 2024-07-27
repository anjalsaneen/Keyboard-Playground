//
//  PlaygroundApp.swift
//  Playground
//
//  Created by Anjal Saneen on 11/07/24.
//

import SwiftUI

@main
struct PlaygroundApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
            print("Received Url \(url)")
            if url.scheme == "myapp" {
                // Handle opening the app from the URL
                print("App opened via URL scheme: \(url)")
            }
            return true
        }
    }
}
