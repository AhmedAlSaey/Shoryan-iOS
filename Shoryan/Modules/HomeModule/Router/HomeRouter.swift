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
    
    func createDetailedReward(withReward reward: DetailedRewardResponse, isVerifying: Bool) -> DetailedRewardViewController {
        let vc = DetailedRewardViewController()
        let presenter = DetailedRewardPresenter()
        presenter.currentState = isVerifying ? .PostRedeem : .PreRedeem
        vc.presenter = presenter
        presenter.view = vc
        presenter.detailedReward = reward
        return vc
    }
    
    func createSuccessRedeem() -> SuccessRedeemViewController {
        let vc = SuccessRedeemViewController()
        let presenter = SuccessRedeemPresenter()
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
    
    func pushDetailedReward(withReward reward: DetailedRewardResponse, isVerifying: Bool){
        let vc = createDetailedReward(withReward: reward, isVerifying: isVerifying)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushSuccessRedeem(){
        let vc = createSuccessRedeem()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func popToRootViewController() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func popAllRewardsScreen() {
        let n: Int! = self.navigationController?.viewControllers.count
        guard let _ = self.navigationController?.viewControllers[n-1] as? AllRewardsViewController else {fatalError()}
        navigationController?.popViewController(animated: true)
    }
    
    func popDetailedRewardScreen() {
        let n: Int! = self.navigationController?.viewControllers.count
        guard let _ = self.navigationController?.viewControllers[n-1] as? DetailedRewardViewController else {fatalError()}
        navigationController?.popViewController(animated: true)
    }
    
}
