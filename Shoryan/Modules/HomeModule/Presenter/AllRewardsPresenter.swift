//
//  AllRewardsPresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 26/06/2021.
//

import UIKit

class AllRewardsPresenter: BasePresenter, UICollectionViewDataSource {
    var rewards: [SimpleReward]?
    override func viewDidLoad() {
        if let view = view as? AllRewardsViewController {
            showLoading()
            view.rewardsCollectionView.dataSource = self
            HomeInteractor.shared.getAllRewards { result in
                self.dismissLoading()
                switch result {
                case .success(let rewards):
                    self.rewards = rewards
                    view.rewardsCollectionView.reloadData()
                case .failure(let error):
                    view.showAlert(error: error)
                }
                
            }
        }
        
    }
    
    func rewardsSelected(atIndexpath indexPath: IndexPath){
        let rewardsID = rewards![indexPath.row].id
        if let view = view as? AllRewardsViewController {
            HomeInteractor.shared.getDetailedReward(rewardID: rewardsID) { result in
                switch result {
                case .success(let detailedReward):
                    if detailedReward.successfulResponse.isRedeemingThisReward {
                        HomeRouter.shared.pushDetailedReward(withReward: detailedReward, isVerifying: true)
                    }
                    else{
                        HomeRouter.shared.pushDetailedReward(withReward: detailedReward, isVerifying: false)
                    }
                case .failure(let error):
                    view.showAlert(error: error)
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        rewards?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let view = view as? AllRewardsViewController else {fatalError()}
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: view.reuseIdentifier, for: indexPath) as! RewardCollectionViewCell
        cell.imageURL = rewards![indexPath.row].imageURL
        cell.points = rewards![indexPath.row].pointCost
        return cell
    }
    
    func backButtonPressed() {
        HomeRouter.shared.popAllRewardsScreen()
    }
}


