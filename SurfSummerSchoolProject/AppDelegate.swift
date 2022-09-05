//
//  AppDelegate.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/3/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var tokenStorage: TokenStorage {
        BaseTokenStorage()
        }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        
        startApplicationProces()
        
        return true
    }
    
    func startApplicationProces() {
        runLaunchScreen()
        
        if let tokenContainer = try? tokenStorage.getToken(), !tokenContainer.isExpired {
            runMainFlow()
        } else {
            let tempCredentials = AuthRequestModel(phone: "+71234567890", password: "qwerty")
            AuthService().performLoginRequestAndSaveToken(credentials: tempCredentials) { result in
                switch result {
                case .success:
                    self.runMainFlow()
                case .failure:
                    //Handle error, if token wasn't received
                    DispatchQueue.main.async {
                        MainViewController().navigationController?.pushViewController(ErrorViewController(), animated: true)
                    }
                }
            }
        }
    }
    
    func runMainFlow() {
        DispatchQueue.main.async {
            self.window?.rootViewController = TabBarConfigurator().configure()
        }
    }
    
    func runLaunchScreen() {
        let launchScreenViewController = UIStoryboard(name: "LaunchScreen", bundle: .main).instantiateInitialViewController()
        window?.rootViewController = launchScreenViewController
    }
    
    func runLoginScreen() {
        window?.rootViewController = LoginViewController()
    }

}

