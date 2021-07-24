//
//  ProfileRouter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import UIKit

class ProfileRouter: BaseRouter {
    
    
    var navigationController: UINavigationController?
    
    static let shared = ProfileRouter()
    
    
    func createProfile() -> UIViewController {
        let viewController = ProfileViewController()
        
        let presenter = ProfilePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.view = viewController
        
        return viewController
    }
    
    func createProfileEmbeddedInViewController() -> UIViewController {
        let nc = embedInNavigationController(viewController: createProfile())
        navigationController = nc
        nc.isNavigationBarHidden = true
        return nc
    }
    
    func createLanguageSelection() -> UIViewController {
        let viewController = LanguagePickerViewController()
        return viewController
    }
    
    func createAccountInfo() -> UIViewController {
        let viewController = AccountInfoViewController()
        return viewController
    }
    
    func createMapSelection() -> UIViewController{
        let viewController = MapSelectorViewController()
        
        return viewController
    }
    
    func createChangePassword() -> UIViewController{
        let viewController = ChangePasswordViewController()
        
        return viewController
    }
    
    func pushMapSelector(delegate: MapSelectorDelegate){
        if let vc = createMapSelection() as? MapSelectorViewController {
            vc.delegate = delegate
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func pushAccountInfo() {
        guard let vc = createAccountInfo() as? AccountInfoViewController else {fatalError()}
        let presenter = AccountInfoPresenter()
        vc.presenter = presenter
        presenter.view = vc
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushChangePassword() {
        guard let vc = createChangePassword() as? ChangePasswordViewController else {fatalError()}
        let presenter = ChangePasswordPresenter()
        vc.presenter = presenter
        presenter.view = vc
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func launchAuthorizationPage() {
        LaunchRouter.shared.launchAuthorizationPage()
    }
    
    func presentLanguageSelectionScreen(onTopOf view: UIViewController){
        let vc = createLanguageSelection()
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        view.present(vc, animated: true, completion: nil)
    }
    
    func dissmissAccountInfo(){
        guard let _ = navigationController?.viewControllers.last as? AccountInfoViewController else {fatalError()}
        navigationController?.popViewController(animated: true)
    }
    
    func dissmissChangePassword(){
        guard let _ = navigationController?.viewControllers.last as? ChangePasswordViewController else {fatalError()}
        navigationController?.popViewController(animated: true)
    }
    
    func dissmissMapSelector() {
        guard let _ = navigationController?.viewControllers.last as? MapSelectorViewController else {fatalError()}
        navigationController?.popViewController(animated: true)
    }
    
}
