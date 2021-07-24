//
//  BaseViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/12/2020.
//

import UIKit
import JGProgressHUD
import Localize_Swift

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {
    
    private var refresher: UIRefreshControl!
    var presenter : BasePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()

        localizeStrings()
        localizeAssets()
        localizationSettings()
        
        let backButton = UIBarButtonItem()
         backButton.title = "رجوع"
         self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        makeNavigationBarTransparent()
        hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LCLLanguageChangeNotification), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewDidAppear()
        
    }
    
    func localizeStrings() {
        
    }
    
    func localizeAssets() {
        
    }
    
    func localizationSettings() {
        
    }
    
    @objc func localize() {
        localizeStrings()
        localizeAssets()
        localizationSettings()
        let langStr = "language-code".localized()
        // TODO: - Move this to a separate class
        if langStr == "ar" {
            self.view.semanticContentAttribute = .forceRightToLeft
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            UITextField.appearance().textAlignment = .right
            navigationController?.view.semanticContentAttribute = .forceRightToLeft
            navigationController?.navigationBar.semanticContentAttribute = .forceRightToLeft
        } else {
            self.view.semanticContentAttribute = .forceLeftToRight
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            UITextField.appearance().textAlignment = .left
            navigationController?.view.semanticContentAttribute = .forceLeftToRight
            navigationController?.navigationBar.semanticContentAttribute = .forceLeftToRight
        }
        
    }
    func getPreferredLocale() -> Locale {
        guard let preferredIdentifier = Locale.preferredLanguages.first else {
            return Locale.current
        }
        return Locale(identifier: preferredIdentifier)
    }

    func makeNavigationBarTransparent () {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
    }
    
    func addCustomNavigationBackButton() {
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 26)
        backButton.addTarget(self, action: #selector(backAction(_:)), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.hidesBackButton = true
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    

    func hideNavigationBarShadow(for navigationController:UINavigationController) {
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = false
    }
    func makeNavigationBarTransparent(for navigationController: UINavigationController) {
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = true
        navigationController.view.backgroundColor = .clear
    }
    
    func showAlert(error: Error, okAction: (() -> ())? = nil) {
        var message = error.localizedDescription
        if let baseError = error as? BaseError, let baseMessage = baseError.message {
            message = baseMessage
        }
        
        showAlert(title: "Error".localized(), message: message, okAction: okAction)
    }
    
    func showAlert(message: String) {
        showAlert(title: "Error".localized(), message: message)
    }
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok".localized(), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String, okAction: (() -> ())? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok".localized(), style: .default, handler: { (action) in
            okAction?()
        }))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func showDislaimer(title: String, message: String, agreeAction: @escaping () -> (), agreeTitle: String = "Ok".localized()){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: agreeTitle, style: .default, handler: { (action) in
            agreeAction()
        }))
        alert.addAction(UIAlertAction(title: "Cancel".localized(), style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    var hud: JGProgressHUD?
    func showLoading() {
        DispatchQueue.main.async {
            self.hud = JGProgressHUD()
            self.hud?.textLabel.text = "Loading".localized()
            self.hud?.show(in: self.view)
        }
    }
    
    func dismissLoading() {
        self.hud?.dismiss()
    }
    
    @objc @IBAction func backAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @objc @IBAction func okAction(_ sender: UIButton) {
    
    }
    func hideKeyboardWhenTappedAround(targetView: UIView? = nil) {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        if targetView == nil {
            view.addGestureRecognizer(tap)
        } else {
            targetView?.addGestureRecognizer(tap)
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
