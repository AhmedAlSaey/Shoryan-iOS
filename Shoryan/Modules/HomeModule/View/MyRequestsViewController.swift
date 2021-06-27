//
//  MyRequestsViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/06/2021.
//

import UIKit

class MyRequestsViewController: BaseViewController {
    

    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var myRequestsNavTitle: UILabel!
    @IBOutlet weak var myRequestsTableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    
    
    var requests: [SimpleRequest]? {
        didSet {
            myRequestsTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleNavigationBar()
        configureTableView()
        // Do any additional setup after loading the view.
    }
    
    override func localizeStrings() {
        myRequestsNavTitle.text = "myrequestsnavtitle.label".localized()
    }
    
    override func localizeAssets() {
        backButton.setImage(UIImage(named: "back-arrow-white".localized()), for: .normal)
    }
    
    func styleNavigationBar() {
//        let barHeight = navigationController?.navigationBar.layer.frame.height ?? 0
//        navBarTopConstraint.constant -= barHeight
        navigationBarView.addSpecificCornerRadius(forCorners: .Bottom, radius: 20)
    }

    func configureTableView(){
        myRequestsTableView.delegate = self
        myRequestsTableView.dataSource = self
    
        myRequestsTableView.register(UINib(nibName: "RequestBasicTableViewCell", bundle: nil), forCellReuseIdentifier: "RequestCell")
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        if let presenter = presenter as? MyRequestsPresenter {
            presenter.backButtonClicked()
        }
    }
    
    @IBAction func addRequestButtonClicked(_ sender: Any) {
        if let presenter = presenter as? MyRequestsPresenter {
            presenter.addRequestButtonLClicked()
        }
    }
    
    
}

extension MyRequestsViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        if let presenter = presenter as? MyRequestsPresenter {
            presenter.requestSelected(atRow: indexPath.row)
        }
    }
    
    
}
