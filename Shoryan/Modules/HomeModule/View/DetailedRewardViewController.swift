//
//  DetailedRewardViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 26/06/2021.
//

import UIKit

class DetailedRewardViewController: BaseViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    

    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var rewardNavTitle: UILabel!
    @IBOutlet weak var branchesLabel: UILabel!
    @IBOutlet weak var branchView: UIView!
    @IBOutlet weak var branchDropdownImage: UIImageView!
    @IBOutlet weak var redeemButton: UIButton!
    @IBOutlet weak var codesStackView: UIStackView!
    
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var pointsView: UIView!
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var iconImageViewContainer: UIView!
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var branchesTextField: UITextField!
    @IBOutlet weak var rewardDescription: UILabel!
    
    @IBOutlet weak var codeInstructionLabel: UILabel!
    @IBOutlet weak var codeTF1: UnderlinedUITextField!
    @IBOutlet weak var codeTF2: UnderlinedUITextField!
    @IBOutlet weak var codeTF3: UnderlinedUITextField!
    @IBOutlet weak var codeTF4: UnderlinedUITextField!
    @IBOutlet weak var codeTF5: UnderlinedUITextField!
    @IBOutlet weak var codeTF6: UnderlinedUITextField!
    @IBOutlet weak var resendCodeButton: UIButton!
    
    @IBOutlet weak var preRedeemView: UIView!
    @IBOutlet weak var postRedeemView: UIView!
    
    
    var branchesPickerView: UIPickerView = UIPickerView()
    var branches: [SimpleBranch]? {
        didSet {
            if isViewLoaded {
                branchesPickerView.reloadAllComponents()
                let row = branchesPickerView.selectedRow(inComponent: 0)
                branchesTextField.text = branches![row].formattedAddress
            }
        }
    
    }
    
    var code: String {
        get{
            var result : String = ""
            result += codeTF1.text.nonNullString
            result += codeTF2.text.nonNullString
            result += codeTF3.text.nonNullString
            result += codeTF4.text.nonNullString
            result += codeTF5.text.nonNullString
            result += codeTF6.text.nonNullString
            return result
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        setupUI()
        setupTextFields()
        // Do any additional setup after loading the view.
    }
    
    func styleNavigationBar() {
//        let barHeight = navigationController?.navigationBar.layer.frame.height ?? 0
//        navBarTopConstraint.constant -= barHeight
        navigationBarView.addSpecificCornerRadius(forCorners: .Bottom, radius: 20)
    }
    
    override func localizeStrings() {
        rewardNavTitle.text = "rewardnavtitle.label".localized()
        branchesLabel.text = "rewardnavtitle.label".localized()
        redeemButton.setTitle("redeem.button".localized(), for: .normal)
        codeInstructionLabel.text = "rewardcodeinstruction.label".localized()
        resendCodeButton.setTitle("resendcode.button".localized(), for: .normal)
    }
    
    override func localizeAssets() {
        backButton.setImage(UIImage(named: "back-arrow-white".localized()), for: .normal)
    }
    
    func configureTextFields(){
        branchesPickerView.delegate = self
        branchesPickerView.dataSource = self
        branchesTextField.inputView = branchesPickerView
    }
    func setupUI() {
        branchView.layer.borderColor = ThemeConstants.colorShoryanMain.cgColor
        branchView.layer.borderWidth = 1
        branchView.layer.cornerRadius = branchView.layer.frame.height / 2
        
        redeemButton.layer.cornerRadius = redeemButton.frame.height/2
        
        iconImageView.applyshadowWithCorner(containerView: iconImageViewContainer, cornerRadius: iconImageViewContainer.frame.width/2, shadowWidth: 0, shadowHeight: 2)
        
        pointsView.addSpecificCornerRadius(forCorners: .Right, radius: pointsView.frame.height/2)
        pointsView.dropShadow(widthOffset: 1, heightOffset: 2)
        styleNavigationBar()
        codesStackView.semanticContentAttribute = .forceLeftToRight
    }
    
    func setupTextFields(){
        codeTF1.delegate = self
        codeTF2.delegate = self
        codeTF3.delegate = self
        codeTF4.delegate = self
        codeTF5.delegate = self
        codeTF6.delegate = self
        
        codeTF1.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        codeTF2.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        codeTF3.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        codeTF4.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        codeTF5.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        codeTF6.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(textField: UITextField){

        let text = textField.text.nonNullString

        if text.count >= 1{
            switch textField{
            case codeTF1:
                codeTF2.becomeFirstResponder()
            case codeTF2:
                codeTF3.becomeFirstResponder()
            case codeTF3:
                codeTF4.becomeFirstResponder()
            case codeTF4:
                codeTF5.becomeFirstResponder()
            case codeTF5:
                codeTF6.becomeFirstResponder()
            case codeTF6:
                codeTF6.resignFirstResponder()
            default:
                break
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
            textField.text = ""
        }
    
    
    
    @IBAction func redeemButtonClicked(_ sender: Any) {
        if let presenter = presenter as? DetailedRewardPresenter {
            presenter.redeemButtonClicked(selectedIndex: branchesPickerView.selectedRow(inComponent: 0))
        }
    }
    
    @IBAction func resendButtonClicked(_ sender: Any) {
        if let presenter = presenter as? DetailedRewardPresenter {
            presenter.resendButtonClicked(selectedIndex: branchesPickerView.selectedRow(inComponent: 0))
        }
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        if let presenter = presenter as? DetailedRewardPresenter {
            presenter.backButtonPressed()
        }
    }
    
    
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return branches?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        branchesTextField.text = branches![row].formattedAddress
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return branches![row].formattedAddress
        
    }

}
