//
//  BaseRouter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/12/2020.
//

import UIKit

class BaseRouter: NSObject {
    
    var window : UIWindow?
    
    func embedInNavigationController(viewController:UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
    func hideNavigationBarShadow(for navigationController:UINavigationController) {
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = false
    }
    
    func makeNavigationBarTransparent(for navigationController: UINavigationController) {
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = true
        navigationController.view.backgroundColor = .clear
    }
    
    func initializeWindowWithNavigationControllerAnimation(rootViewController : UIViewController){
        if self.window == nil {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene  else {return}
            window = UIWindow(frame: windowScene.coordinateSpace.bounds)
            window?.windowScene = windowScene
            window?.rootViewController = rootViewController
        }

        rootViewController.view.frame = (window?.bounds)!
        window?.addSubview(rootViewController.view)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = .push
        transition.subtype = .fromLeft
        window?.rootViewController?.view.layer.add(transition, forKey: "transition")
        rootViewController.view.layer.add(transition, forKey: "transition")
        window?.rootViewController?.view.isHidden = true
        rootViewController.view.isHidden = false
        window?.makeKeyAndVisible()
        
        
    }
    
}
