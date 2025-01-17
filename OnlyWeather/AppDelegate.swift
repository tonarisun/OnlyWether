//
//  AppDelegate.swift
//  OnlyWeather
//
//  Created by Olga Lidman on 03/06/2019.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit
import Firebase
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.setInitialViewController()
        self.configureFirebase()
        self.configureRealm()
        self.saveUserLanguage()
        return true
    }
    
    private func setInitialViewController() {
        let viewController = UIStoryboard(name: "WeatherViewController", bundle: nil).instantiateInitialViewController()
        self.window?.rootViewController = viewController
    }
    
    private func configureFirebase() {
        FirebaseApp.configure()
        let db = Firestore.firestore()
        print(db)
    }
    
    private func configureRealm() {
        do {
            let realm = try Realm()
            realm.beginWrite()
            try realm.commitWrite()
            print(realm.configuration.fileURL ?? "No fileURL")
        }
        catch {
            print(error)
        }
    }
    
    func saveUserLanguage() {
        let userLanguage = NSLocale.preferredLanguages.first!
        UserDefaults.standard.set(userLanguage.hasPrefix("ru"), forKey: Constants.isRussianLanguage)
    }
}

