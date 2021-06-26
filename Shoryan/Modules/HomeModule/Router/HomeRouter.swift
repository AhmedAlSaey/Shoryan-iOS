//
//  HomeRouter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//


import UIKit

class HomeRouter: BaseRouter {
    
    
    var navigationController: UINavigationController?
    
    static let shared = HomeRouter()
    
    
    func createHomePage() -> UIViewController {
        let viewController = HomeViewController()
        
        let presenter = HomePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.view = viewController
        
        return viewController
    }
    
    func createHomePageEmbeddedInViewController() -> UIViewController {
        let nc = embedInNavigationController(viewController: createHomePage())
        navigationController = nc
        nc.isNavigationBarHidden = true
        return nc
    }
    
    func createDetailedRequestScreen() -> RequestViewController {
        let vc = RequestViewController()
        let presenter = RequestPresenter()
        
        vc.presenter = presenter
        presenter.view = vc
        
        return vc
    }
    
    func createFilter() -> FilterRequestsViewController {
        let vc = FilterRequestsViewController()
        return vc
    }
    
    func createRewards() -> AllRewardsViewController {
        let vc = AllRewardsViewController()
        let presenter = AllRewardsPresenter()
        vc.presenter = presenter
        presenter.view = vc
        return vc
    }
    
    func presentRequest(detailedRequest: DetailedRequest){
        let vc = createDetailedRequestScreen()
        vc.request = detailedRequest
        navigationController?.present(vc, animated: true, completion: nil)
    }
    
    func presentFilter(delegate: FilterDelegate, params: [String : String]?){
        let vc = createFilter()
        vc.delegate = delegate
        vc.parameters = params
        navigationController?.present(vc, animated: true, completion: nil)
    }
    
    
    func pushRewards() {
        let vc = createRewards()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
