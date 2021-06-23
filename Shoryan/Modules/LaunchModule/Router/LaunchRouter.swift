//
//  LaunchRouter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/12/2020.
//  
//

import Foundation
import UIKit

class LaunchRouter: BaseRouter, UITabBarControllerDelegate {
    
    var tabBarController: UITabBarController?
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
    
    func createAuthenticationWithSMS(phoneNumber: String, delegate: SMSAuthenticatorDelegate) -> UIViewController {
        
        let viewController = SMSAuthenticationViewController()
        
        let presenter = SMSAuthenticationPresenter()
        presenter.phoneNumber = phoneNumber
        viewController.presenter = presenter
        viewController.presenter?.view = viewController
        presenter.delegate = delegate
        
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
    
    func createMapSelectionSignup() -> UIViewController{
        let viewController = MapSelectorViewController()
        
        return viewController
    }
    
    
    func launchAuthorizationPage() {
        let nc = embedInNavigationController(viewController: createAuthorization())
        nc.isNavigationBarHidden = true
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
    
    
    
    func pushSMSAuthenticationScreen(phoneNumber: String, delegate: SMSAuthenticatorDelegate) {
        let vc = createAuthenticationWithSMS(phoneNumber: phoneNumber, delegate: delegate)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushSignUp() {
        let vc = createSignUp()
        navigationController?.pushViewController(vc, animated: true)
    }
    func dissmissSignup(){
        guard let _ = navigationController?.viewControllers.last as? SignUpViewController else {fatalError()}
        navigationController?.popViewController(animated: true)
    }
    
    func dismissLogin() {
        guard let _ = navigationController?.viewControllers.last as? LogInViewController else {fatalError()}
        navigationController?.popViewController(animated: true)
    }
    
    func dismissLogInPassword() {
        guard let _ = navigationController?.viewControllers.last as? LogInPasswordViewController else {fatalError()}
        navigationController?.popViewController(animated: true)
    }
    
    func dismissSMSAuthentication() {
        guard let _ = navigationController?.viewControllers.last as? SMSAuthenticationViewController else {fatalError()}
        navigationController?.popViewController(animated: true)
    }
    
    func dissmissMapSelector() {
        guard let _ = navigationController?.viewControllers.last as? MapSelectorViewController else {fatalError()}
        navigationController?.popViewController(animated: true)
    }
    
    func launchStartScreen() {
        
        let homeViewController = HomeRouter.shared.createHomePageEmbeddedInViewController()
        let newRequestViewController = NewRequestRouter.shared.createNewRequestEmbeddedInViewController()
        let notificationsVewController = NotificationsRouter.shared.createNotificationsEmbeddedInViewController()
        let profileViewController = ProfileRouter.shared.createProfileEmbeddedInViewController()
        
        let homeTabVC = createViewControllerTab(viewController: homeViewController, title: "الصفحة الرئيسية", image: "Home-2", selectedImage: "home-1")
        let newRequestTabVC = createViewControllerTab(viewController: newRequestViewController, title: "طلب جديد", image: "blood-drop", selectedImage: "blood-drop-3")
        let notificationsTabVC = createViewControllerTab(viewController: notificationsVewController, title: "الإشعارات", image: "Notification", selectedImage: "Notification-1")
        let profileTabVC = createViewControllerTab(viewController: profileViewController, title: "حسابى", image: "user", selectedImage: "user-4")
        
        tabBarController = MainTabBarViewController()
        tabBarController!.delegate = self
        tabBarController!.viewControllers = [
            profileTabVC,
            notificationsTabVC,
            newRequestTabVC,
            homeTabVC,
        ]
        tabBarController?.selectedIndex = 3
        
        
        initializeWindowWithNavigationControllerAnimation(rootViewController: tabBarController!)
        
        
    }
    
    func launchMapSelectorSignup(delegate: MapSelectorDelegate){
        if let vc = createMapSelectionSignup() as? MapSelectorViewController {
            vc.delegate = delegate
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    func createViewControllerTab(viewController: UIViewController, title: String, image: String, selectedImage: String) -> UIViewController {
        
        viewController.tabBarItem.title = title
        let image = UIImage(named: image)
        viewController.tabBarItem.image = image
        
        
        return viewController
    }
    
    
    
    
    
}
