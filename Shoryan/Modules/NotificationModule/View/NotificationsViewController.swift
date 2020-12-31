//
//  NotificationsViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import UIKit

class NotificationsViewController: BaseViewController {

    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var navBarTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var notificationsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleNavigationBar()
        setupTableView()
    }
    
    func styleNavigationBar() {
        let barHeight = navigationController?.navigationBar.layer.frame.height ?? 0
        navBarTopConstraint.constant -= barHeight
        navigationBarView.addSpecificCornerRadius(forCorners: .Bottom, radius: 20)
        
    }
    
    func setupTableView() {
        notificationsTableView.delegate = self
        notificationsTableView.dataSource = self
        notificationsTableView.register(UINib(nibName: "NotificationTableViewCell", bundle: nil), forCellReuseIdentifier: "NotificationsCell")
    }



}

extension NotificationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationsCell", for: indexPath)
        guard let notificationCell = cell as? NotificationTableViewCell else {fatalError()}
        
        notificationCell.notificationTitle = "طلب جديد"
        notificationCell.notificationDescription = "بنك الدم المتواجد بالقرب منك به نقص، نحن نحتاج اليك "
        notificationCell.notificationTime = "منذ ۳ ي "
        return notificationCell
    }
    
    
}
