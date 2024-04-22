//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Alondra García Morales on 22/04/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate : NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
@main
struct ChatAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        let login = MessagesViewModel()
        
        WindowGroup {
            ContentView()
                .environmentObject(login)
        }
    }
}
