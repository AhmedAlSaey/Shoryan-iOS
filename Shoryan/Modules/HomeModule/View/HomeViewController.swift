//
//  HomeViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import UIKit
import SnapKit

class HomeViewController: BaseViewController {
    
    

    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var leftImageViewContainer: UIView!
    
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var rightImageViewContainer: UIView!
    
    @IBOutlet weak var navBarTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var navigationBarView: UIView!
    
    @IBOutlet weak var requestsTableView: UITableView!
    
    @IBOutlet weak var filterView: UIView!
    
    var requests: [SimpleRequest]? {
        didSet {
            requestsTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        styleNavigationBar()
        configureCards()
        configureFilterView()
        configureTableView()
        
    }
    
    func styleNavigationBar() {
        let barHeight = navigationController?.navigationBar.layer.frame.height ?? 0
        navBarTopConstraint.constant -= barHeight
        navigationBarView.addSpecificCornerRadius(forCorners: .Bottom, radius: 20)
    }
    
    func configureCards() {
        
        configureCard(target: leftImageView, targetContainer: leftImageViewContainer, topImageTitle: "Rectangle 1446", bottomImageTitle: "label-hands-inscription-follow-instructions-3.png", cardText: "طلباتى") {
            // TODO: - Talabaty click action
        }
        
        configureCard(target: rightImageView, targetContainer: rightImageViewContainer, topImageTitle: "Rectangle 1446", bottomImageTitle: "label-hands-inscription-follow-instructions-1", cardText: "في انتظارك") {
            // TODO: - Fe entzarek click action
        }
    }
    
    func configureFilterView() {
        filterView.layer.borderWidth = 1
        filterView.layer.borderColor = UIColor.black.cgColor
        filterView.layer.cornerRadius = 11
    }
    
    func configureTableView(){
        requestsTableView.delegate = self
        requestsTableView.dataSource = self
        
        requestsTableView.register(UINib(nibName: "RequestBasicTableViewCell", bundle: nil), forCellReuseIdentifier: "RequestCell")
    }
    
    func configureCard(target: UIImageView, targetContainer: UIView, topImageTitle: String, bottomImageTitle: String, cardText: String, clickAction: () -> ()) {
        let topImage = UIImage(named: topImageTitle)
        let bottomImage = UIImage(named: bottomImageTitle)

        let size = CGSize(width: 300, height: 300)
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
        textLabel.font = UIFont(name:"Arial",size:18)
        textLabel.textColor = .white
        targetContainer.addSubview(textLabel)
        textLabel.snp.makeConstraints { (make) -> Void in
            make.bottom.equalToSuperview().offset(-7)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
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
            return cell
        }
        return UITableViewCell()
    }
    
}
