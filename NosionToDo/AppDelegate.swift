//
//  AppDelegate.swift
//  NosionToDo
//
//  Created by Максим Гаврилюк on 17.10.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var navController = UINavigationController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch
        
        /*
        let introductionViewController = IntroductionViewController()
        self.navController = UINavigationController(rootViewController: introductionViewController)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = self.navController
        
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        
        return true
         */
        return true
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

