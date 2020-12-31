//
//  LaunchRouter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/12/2020.
//  
//

import Foundation
import UIKit

class LaunchRouter: BaseRouter {
    
    
    var navigationController: UINavigationController?
    
    static let shared = LaunchRouter()
    // MARK: Static methods
    func createLaunchScreen() -> UIViewController {
        
        let viewController = LaunchScreenViewController()
        
        let presenter = LaunchScreenPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.view = viewController
        
        return viewController
    }
    
    func createLogIn() -> UIViewController {
        
        let viewController = LogInViewController()
        
        let presenter = LogInPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.view = viewController
        
        return viewController
    }
    
    func createLogInWithPassword(phoneNumber: String) -> UIViewController {
        
        let viewController = LogInPasswordViewController()
        
        let presenter = LogInPasswordPresenter()
        presenter.phoneNumber = phoneNumber
        viewController.presenter = presenter
        viewController.presenter?.view = viewController
        
        return viewController
    }
    
    func createLogInWithSMS(phoneNumber: String) -> UIViewController {
        
        let viewController = LogInSMSViewController()
        
        let presenter = LogInSMSPresenter()
        presenter.phoneNumber = phoneNumber
        viewController.presenter = presenter
        viewController.presenter?.view = viewController
        
        return viewController
    }
    
    func createAuthorization() -> UIViewController {
        
        let viewController = AuthorizationViewController()
        
        let presenter = AuthorizationPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.view = viewController
        
        return viewController
    }
    
    func createSignUp() -> UIViewController{
        let viewController = SignUpViewController()
        
        let presenter = SignUpPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.view = viewController
        
        return viewController
    }
    
    
    func launchAuthorizationPage() {
        let nc = embedInNavigationController(viewController: createAuthorization())
        navigationController = nc
        self.initializeWindowWithNavigationControllerAnimation(rootViewController: nc)
    }
    
    func pushLogInPage() {
        let vc = createLogIn()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushLogInWithPasswordPage(phoneNumber: String) {
        let vc = createLogInWithPassword(phoneNumber: phoneNumber)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushLogInWithSMSPage(phoneNumber: String) {
        let vc = createLogInWithSMS(phoneNumber: phoneNumber)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushSignUp() {
        let vc = createSignUp()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func launchStartSscreen() {
//        HomeRouter.shared.launchHomePage()
//        NewRequestRouter.shared.launchNewRequestPage()
        NotificationsRouter.shared.launchNotifications()
    }
    
    
    
}
