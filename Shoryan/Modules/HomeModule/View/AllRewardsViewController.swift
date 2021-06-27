//
//  AllRewardsViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 26/06/2021.
//

import UIKit

class AllRewardsViewController: BaseViewController {

    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var rewardsNavLabel: UILabel!
    @IBOutlet weak var rewardsCollectionView: UICollectionView!
    @IBOutlet weak var backButton: UIButton!
    let reuseIdentifier = "RewardCell"
    private let sectionInsets = UIEdgeInsets(
      top: 32,
      left: 35,
      bottom: 32,
      right: 35)
    private let itemsPerRow: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rewardsCollectionView.register(UINib(nibName: "RewardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        rewardsCollectionView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func localizeStrings() {
        rewardsNavLabel.text = "rewardsnavtitle.label".localized()
    }
    
    override func localizeAssets() {
        backButton.setImage(UIImage(named: "back-arrow-white".localized()), for: .normal)
    }
    
    func styleNavigationBar() {
        //        let barHeight = navigationController?.navigationBar.layer.frame.height ?? 0
        //        navBarTopConstraint.constant -= barHeight
                navigationBarView.addSpecificCornerRadius(forCorners: .Bottom, radius: 20)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        if let presenter = presenter as? AllRewardsPresenter {
            presenter.backButtonPressed()
        }
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AllRewardsViewController : UICollectionViewDelegateFlowLayout {
    // 1
      func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
      ) -> CGSize {
        // 2
        let paddingSpace = sectionInsets.left * 2 + 55
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem * 1.34)
      }
      
      // 3
      func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
      ) -> UIEdgeInsets {
        return sectionInsets
      }
      
      // 4
      func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
      ) -> CGFloat {
        return 38
      }
}

extension AllRewardsViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let presenter = presenter as? AllRewardsPresenter {
            presenter.rewardsSelected(atIndexpath: indexPath)
        }
    }
}


