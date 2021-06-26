//
//  FilterRequestsViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 25/06/2021.
//

import UIKit

protocol FilterDelegate {
    func viewWillDisappear(withParameters params: [String : String])
}

class FilterRequestsViewController: BaseViewController {
    
    @IBOutlet weak var filterLabel: UILabel!
    @IBOutlet weak var bloodTypeLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var backgroundView: UIView!
    
    //bt -> blood type
    @IBOutlet weak var bt1Button: UIButton!
    @IBOutlet weak var bt2Button: UIButton!
    @IBOutlet weak var bt3Button: UIButton!
    @IBOutlet weak var bt4Button: UIButton!
    @IBOutlet weak var bt5Button: UIButton!
    @IBOutlet weak var bt6Button: UIButton!
    @IBOutlet weak var bt7Button: UIButton!
    @IBOutlet weak var bt8Button: UIButton!
    @IBOutlet weak var bt9Button: UIButton!
    
    var delegate: FilterDelegate?
    var parameters : [String:String]? {
        didSet{
            setupInitialParameters()
        }
    }
    
    var currentlySelectedButton : UIButton?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupInitialParameters()
    }
    
    override func localizeStrings() {
        filterLabel.text = "filternavtitle.label".localized()
        bloodTypeLabel.text = "bloodtype.label".localized()
        resetButton.setTitle("reset.button".localized(), for: .normal)
        bt9Button.setTitle("allowedbloodtyped.button".localized(), for: .normal)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        var parameters = [String : String]()
        if let currentlySelectedButton = currentlySelectedButton{
            if currentlySelectedButton.tag == 9 {
                parameters["bloodType"] = "allowed"
            }
            else{
                parameters["bloodType"] = currentlySelectedButton.titleLabel?.text
            }
        }
        delegate?.viewWillDisappear(withParameters: parameters)
        dump(parameters)
        
    }
    
    func setupUI() {
        setupBloodTypeButton(button: bt1Button)
        setupBloodTypeButton(button: bt2Button)
        setupBloodTypeButton(button: bt3Button)
        setupBloodTypeButton(button: bt4Button)
        setupBloodTypeButton(button: bt5Button)
        setupBloodTypeButton(button: bt6Button)
        setupBloodTypeButton(button: bt7Button)
        setupBloodTypeButton(button: bt8Button)
        setupBloodTypeButton(button: bt9Button)
        
        backgroundView.addSpecificCornerRadius(forCorners: .Top, radius: 60)
        backgroundView.dropShadow(widthOffset: 4, heightOffset: -5)
    }
    
    func setupInitialParameters() {
        if let bloodType = parameters?["bloodType"] {
            switch bloodType {
            case "A+":
                selectButton(button: bt1Button)
            case "B+":
                selectButton(button: bt2Button)
            case "AB+":
                selectButton(button: bt3Button)
            case "O+":
                selectButton(button: bt4Button)
            case "A-":
                selectButton(button: bt5Button)
            case "B-":
                selectButton(button: bt6Button)
            case "AB-":
                selectButton(button: bt7Button)
            case "O-":
                selectButton(button: bt8Button)
            case "allowed":
                selectButton(button: bt9Button)
            default:
                break;
            }
        }
    }
    
    func setupBloodTypeButton(button: UIButton){
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func selectionButtonClicked(_ sender: UIButton) {
        toggleButtonSelection(button: sender)
    }
    
    func toggleButtonSelection(button: UIButton?){
        guard let button = button else {return}
        if currentlySelectedButton == button {
            unselectButton(button: button)
        }
        else{
            selectButton(button: button)
        }
    }
    
    func unselectButton(button: UIButton?) {
        button?.backgroundColor = .white
        button?.setTitleColor(.black, for: .normal)
        currentlySelectedButton = nil
    }
    
    func selectButton(button: UIButton?) {
        unselectButton(button: currentlySelectedButton)
        button?.backgroundColor = .black
        button?.setTitleColor(.white, for: .normal)
        currentlySelectedButton = button
    }
    
    @IBAction func exitButtonPressed(_ sender: Any) {        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        unselectButton(button: currentlySelectedButton)
    }
    
    

}
