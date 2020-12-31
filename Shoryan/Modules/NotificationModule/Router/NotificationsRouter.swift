//
//  NotificationsRouter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import UIKit

class NotificationsRouter: BaseRouter {
    
    
    var navigationController: UINavigationController?
    
    static let shared = NotificationsRouter()
    
    
    func createNotifications() -> UIViewController {
        let viewController = NotificationsViewController()
        
        let presenter = NotificationsPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.view = viewController
        
        return viewController
    }
    
    func launchNotifications() {
        let nc = embedInNavigationController(viewController: NotificationsViewController())
        navigationController = nc
        
        self.initializeWindowWithNavigationControllerAnimation(rootViewController: nc)
    }
    
}
