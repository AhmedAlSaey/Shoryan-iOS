//
//  LanguagePickerViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 20/07/2021.
//

import UIKit
import Localize_Swift

class LanguagePickerViewController: BaseViewController {
    

    @IBOutlet weak var changeLanguageButton: UIButton!
    @IBOutlet weak var arabicRadioButton: UIButton!
    @IBOutlet weak var englishRadioButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var languageNavTitle: UILabel!
    
    
    
    var currentlySelectedLanguage = Localize.currentLanguage()
    var radioSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSetup()
    }
    
    override func localizeStrings() {
        languageNavTitle.text = "language.label".localized()
        changeLanguageButton.setTitle("changelanguage.button".localized(), for: .normal)
    }
    
    
    
    func uiSetup() {
        changeLanguageButton.layer.cornerRadius = changeLanguageButton.frame.height / 2
        if currentlySelectedLanguage == "ar" {
            selectArabic()
        }
        else if currentlySelectedLanguage == "en" {
            selectEnglish()
        }
        
        containerView.layer.cornerRadius = 54
        containerView.dropShadow()
    }
    
    func selectEnglish() {
        englishRadioButton.setImage(UIImage(named: "language-radio-selected"), for: .normal)
        arabicRadioButton.setImage(UIImage(named: "language-radio-unselected"), for: .normal)
        currentlySelectedLanguage = "en"
        radioSelected = true
    }
    
    func selectArabic() {
        englishRadioButton.setImage(UIImage(named: "language-radio-unselected"), for: .normal)
        arabicRadioButton.setImage(UIImage(named: "language-radio-selected"), for: .normal)
        currentlySelectedLanguage = "ar"
        radioSelected = true
    }
    
    
    @IBAction func radioSelected(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            selectArabic()
        case 2:
            selectEnglish()
        default:
            fatalError()
        }
    }
    
    @IBAction func changeLanguagePressed(_ sender: UIButton) {
        if radioSelected {
            self.dismiss(animated: true) {
                Localize.setCurrentLanguage(self.currentlySelectedLanguage)
            }
        }
        
    }
    
    @IBAction func exitButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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

class LanguageOptionView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        self.layer.cornerRadius = 15
        self.layer.borderColor = ThemeConstants.colorDarkGray.cgColor
        self.layer.borderWidth = 1
    }
    
    
}
