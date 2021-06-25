//
//  HomeViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import UIKit
import SnapKit

class HomeViewController: BaseViewController {
    
    

    @IBOutlet weak var myRequestsImageView: UIImageView!
    @IBOutlet weak var myRequestsViewContainer: UIView!
    @IBOutlet weak var pendingRequestImageView: UIImageView!
    @IBOutlet weak var pendingRequestViewContainer: UIView!
    @IBOutlet weak var rewardsImageView: UIImageView!
    @IBOutlet weak var rewardsViewContainer: UIView!
    
    @IBOutlet weak var homeNavigationTitle: UILabel!
    @IBOutlet weak var requestsLabel: UILabel!
    @IBOutlet weak var filterLabel: UILabel!
    @IBOutlet weak var filterView: UIView!
    
    
    @IBOutlet weak var navBarTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var navigationBarView: UIView!
    
    @IBOutlet weak var requestsTableView: UITableView!
    
    
    
    var requests: [SimpleRequest]? {
        didSet {
            requestsTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        styleNavigationBar()
        configureFilterView()
        configureTableView()
        configureCards()
        filterView.semanticContentAttribute = .forceLeftToRight
    }
    
    override func localizeStrings() {
        homeNavigationTitle.text = "homenavigationtitle.label".localized()
        requestsLabel.text = "requests.label".localized()
        filterLabel.text = "filer.button".localized()
    }
    
    func styleNavigationBar() {
//        let barHeight = navigationController?.navigationBar.layer.frame.height ?? 0
//        navBarTopConstraint.constant -= barHeight
        navigationBarView.addSpecificCornerRadius(forCorners: .Bottom, radius: 20)
    }
    
    func configureCards() {
        
        configureCard(target: myRequestsImageView, targetContainer: myRequestsViewContainer, topImageTitle: "Rectangle 1446", bottomImageTitle: "label-hands-inscription-follow-instructions-3.png", cardText: "myrequests.label".localized())
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.myRequestsPressed(_:)))
        myRequestsViewContainer.addGestureRecognizer(tap)
        
        configureCard(target: pendingRequestImageView, targetContainer: pendingRequestViewContainer, topImageTitle: "Rectangle 1446", bottomImageTitle: "label-hands-inscription-follow-instructions-1", cardText: "pendingrequest.label".localized())
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.pendingRequestPressed(_:)))
        pendingRequestViewContainer.addGestureRecognizer(tap2)
        
        configureCard(target: rewardsImageView, targetContainer: rewardsViewContainer, topImageTitle: "Rectangle 1446", bottomImageTitle: "label-hands-inscription-follow-instructions-260nw-1022478005", cardText: "rewards.label".localized())
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.rewardsPressed(_:)))
        rewardsViewContainer.addGestureRecognizer(tap3)
        
        
    }
    
    func configureFilterView() {
        filterView.layer.borderWidth = 1
        filterView.layer.borderColor = UIColor.black.cgColor
        filterView.layer.cornerRadius = 11
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.filterViewPressed(_:)))
        filterView.addGestureRecognizer(tap)
    }
    
    func configureTableView(){
        requestsTableView.delegate = self
        requestsTableView.dataSource = self
        
        requestsTableView.register(UINib(nibName: "RequestBasicTableViewCell", bundle: nil), forCellReuseIdentifier: "RequestCell")
    }
    
    @objc func configureCard(target: UIImageView, targetContainer: UIView, topImageTitle: String, bottomImageTitle: String, cardText: String) {
        let topImage = UIImage(named: topImageTitle)
        let bottomImage = UIImage(named: bottomImageTitle)

        let size = CGSize(width: targetContainer.frame.width, height: targetContainer.frame.height)
        UIGraphicsBeginImageContext(size)

        let areaSize = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        bottomImage!.draw(in: areaSize)

        topImage!.draw(in: areaSize, blendMode: .normal, alpha: 0.8)

        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        target.image = newImage
        target.applyshadowWithCorner(containerView: targetContainer, cornerRadius: 24)
        
        let textLabel = UILabel()
        textLabel.text = cardText
        textLabel.textAlignment = .center
        textLabel.font = UIFont(name:"Arial",size:14)
        textLabel.textColor = .white
        targetContainer.addSubview(textLabel)
        textLabel.snp.makeConstraints { (make) -> Void in
            make.bottom.equalToSuperview().offset(-7)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
        }
        
        
        
        
        
    }
    
    @objc func pendingRequestPressed(_ sender: UITapGestureRecognizer? = nil) {
        if let presenter = presenter as? HomePresenter {
            presenter.pendingRequestCardClicked()
        }
    }
    
    @objc func myRequestsPressed(_ sender: UITapGestureRecognizer? = nil) {
        
    }
    
    @objc func rewardsPressed(_ sender: UITapGestureRecognizer? = nil) {
        
    }
    
    @objc func filterViewPressed(_ sender: UITapGestureRecognizer? = nil) {
        if let presenter = presenter as? HomePresenter {
            presenter.filterViewPressed()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        requests?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let requests = requests {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RequestCell", for: indexPath) as! RequestBasicTableViewCell
            cell.name = requests[indexPath.row].name
            cell.bloodType = requests[indexPath.row].bloodType
            cell.location = requests[indexPath.row].location
            cell.urgent = requests[indexPath.row].requester == .BloodBank
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let presenter = presenter as? HomePresenter {
            presenter.requestSelected(atRow: indexPath.row)
        }
    }
    
}
