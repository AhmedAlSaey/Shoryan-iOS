//
//  DetailedRewardPresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 26/06/2021.
//

import Foundation
import Kingfisher

enum DetailedRewardScreenState {
    case PreRedeem
    case PostRedeem
}

class DetailedRewardPresenter: BasePresenter {
    
    var currentState: DetailedRewardScreenState = .PreRedeem {
        didSet{
            updateUIWithCurrentState()
        }
    }
    var detailedReward: DetailedRewardResponse? {
        didSet {
            setupViewWithDetailedReward()
        }
    }
    override func viewDidLoad() {
        setupViewWithDetailedReward()
        updateUIWithCurrentState()
    }
    
    func setupViewWithDetailedReward() {
        if let view = view as? DetailedRewardViewController, let detailedReward = detailedReward {
            view.branches = detailedReward.successfulResponse.reward.store.branches.map({ branch in
                SimpleBranch(
                    id: branch._id,
                    formattedAddress: "\(branch.location.buildingNumber) " + branch.location.streetName + ", " + branch.location.region + ", " + branch.location.governorate
                )
            })
            view.coverImageView?.kf.setImage(with: URL(string: detailedReward.successfulResponse.reward.store.cover))
            view.iconImageView?.kf.setImage(with: URL(string: detailedReward.successfulResponse.reward.store.logo))
            view.rewardDescription?.text = detailedReward.successfulResponse.reward.description
            view.pointsLabel?.text = "\(AppUser.shared.points!) ".localizeDigits + "Points".localized().lowercased()
        }
    }
    
    func redeemButtonClicked(selectedIndex: Int){
        guard let view = view as? DetailedRewardViewController else {fatalError()}
        if currentState == .PreRedeem{
            if view.branchesTextField.text != "" {
                showLoading()
                HomeInteractor.shared.redeemReward(
                    rewardID: detailedReward!.successfulResponse.reward._id,
                    branchID: detailedReward!.successfulResponse.reward.store.branches[selectedIndex]._id) { result in
                    self.dismissLoading()
                    switch result{
                    case .success(let result):
                        self.currentState = .PostRedeem
                        break
                    case .failure(let error):
                        view.showAlert(error: error)
                    }
                }
            }
            else {
                view.showAlert(title: "Error".localized(), message: "selectbranch.alert".localized())
            }
        }
        else if currentState == .PostRedeem {
            showLoading()
            HomeInteractor.shared.redeemRewardCodeVerification(
                rewardID: detailedReward!.successfulResponse.reward._id,
                branchID: detailedReward!.successfulResponse.reward.store.branches[selectedIndex]._id,
                code: view.code) { result in
                self.dismissLoading()
                switch result{
                case .success(let result):
                    HomeRouter.shared.pushSuccessRedeem()
                    break
                case .failure(let error):
                    view.showAlert(error: error)
                }
            }
        }
        
    }
    
    func resendButtonClicked(selectedIndex: Int) {
        guard let view = view as? DetailedRewardViewController else {fatalError()}
        if selectedIndex != -1 {
            HomeInteractor.shared.redeemReward(
                rewardID: detailedReward!.successfulResponse.reward._id,
                branchID: detailedReward!.successfulResponse.reward.store.branches[selectedIndex]._id) { result in
                switch result{
                case .success(let result):
                    view.showAlert(title: "Done".localized(), message: "coderesent.alert".localized())
                    break
                case .failure(let error):
                    view.showAlert(error: error)
                }
            }
        }
        else {
            view.showAlert(title: "Error".localized(), message: "selectbranch.alert".localized())
        }
    }
    
    func updateUIWithCurrentState() {
        switch currentState {
        case .PostRedeem:
            setupViewForPostVerification()
        case .PreRedeem:
            setupViewForPreVerification()
        }
    }
    
    func setupViewForPreVerification() {
        if let view = view as? DetailedRewardViewController {
            view.preRedeemView?.isHidden = false
            view.postRedeemView?.isHidden = true
            view.resendCodeButton?.isHidden = true
        }
    }
    
    func setupViewForPostVerification() {
        if let view = view as? DetailedRewardViewController {
            view.preRedeemView?.isHidden = true
            view.postRedeemView?.isHidden = false
            view.resendCodeButton?.isHidden = false
        }
    }
    
    func backButtonPressed() {
        HomeRouter.shared.popDetailedRewardScreen()
    }
    
}
