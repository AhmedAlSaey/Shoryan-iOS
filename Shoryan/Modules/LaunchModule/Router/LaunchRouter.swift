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
    
    func createAuthorization() -> UIViewController {
        
        let viewController = AuthorizationViewController()
        
        let presenter = AuthorizationPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.view = viewController
        
        return viewController
    }
    
    func launchHomePage() {
        
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
    
    
    
}
