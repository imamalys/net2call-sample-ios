//
//  AppDelegate.swift
//  Net2Call
//
//  Created by Imam on 23/07/24.
//

import UIKit
import Net2CallSDK
 
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    @Published var username : String = "107001"
    @Published var passwd : String = "sdk@123#"
    @Published var domain : String = "cloud.optimaccs.com"
    @Published var transportType : String = "UDP"
    @Published var port: String = "5160"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        loginAccount()
        
        return true
    }
    
    func loginAccount() {
        SDKManager.holder.required(arg: "").login(username: username, passwd: passwd, domain: domain, transportType: transportType, port: port)
    }
    
    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

