//
//  AppDelegate.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/12/2020.
//

import UIKit
import IQKeyboardManager
import GooglePlaces
import GoogleMaps
import Localize_Swift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch
        var keys: NSDictionary?

        if let path = Bundle.main.url(forResource: "Info", withExtension: ".plist") {
            keys = NSDictionary(contentsOfFile: "\(path)")
            }
            if let dict = keys {
                let googleAPIKey = dict[Constants.googlePListAPIKey] as? String
                GMSPlacesClient.provideAPIKey(googleAPIKey!)
                GMSServices.provideAPIKey(googleAPIKey!)
            }
        
        IQKeyboardManager.shared().isEnabled = true
        let getlan = Localize.currentLanguage()
        if getlan == "en" {
            //English
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            UITextField.appearance().textAlignment = .left
        }
        else {
            //Arabic
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            UITextField.appearance().textAlignment = .right
        }
        
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

