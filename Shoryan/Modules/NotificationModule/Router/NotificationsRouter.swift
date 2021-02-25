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
    
    func createNotificationsEmbeddedInViewController() -> UIViewController {
        let nc = embedInNavigationController(viewController: createNotifications())
        navigationController = nc
        nc.isNavigationBarHidden = true
        return nc
    }
    
}
