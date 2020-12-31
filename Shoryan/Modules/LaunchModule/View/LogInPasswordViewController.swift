//
//  LogInPasswordViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 29/12/2020.
//

import UIKit

class LogInPasswordViewController: BaseViewController {
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        continueButton.layer.cornerRadius = continueButton.layer.frame.height / 2
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func didClickContinue(_ sender: UIButton) {
        if let presenter = presenter as? LogInPasswordPresenter {
            presenter.didClickContinueFromPasswordLogIn(withPassword: password.text.nonNullString)
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
