//
//  RequestViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 21/03/2021.
//

import UIKit
import GoogleMaps

class RequestViewController: BaseViewController {

    
    @IBOutlet weak var donationRequestLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var mapView: UIView!
    @IBOutlet weak var miniCardView: UIView!
    @IBOutlet weak var bloodTypeBackgroundView: UIView!
    @IBOutlet weak var bloodTypeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var bloodBagsLabel: UILabel!
    var bloodBagsCount: Int? {
        didSet {
            bloodBagsLabel.text = "\(bloodBagsCount!) ".localizeDigits + "bloodbags.label".localized()
        }
    }
    
    @IBOutlet weak var donatorsLabel: UILabel!
    var donatorsCount: Int? {
        didSet {
            donatorsLabel.text = "\(donatorsCount!) ".localizeDigits + "activedonors.label".localized()

        }
    }
    
    @IBOutlet weak var disclaimerLabel: UILabel!
    @IBOutlet weak var disclaimerLabelTopConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var secondaryButton: UIButton!
    @IBOutlet weak var SecondaryButtonTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var secondaryButtonHeightConstraint: NSLayoutConstraint!
    enum SecondaryButtonFunctionality {
        case CancelDonation
        case CancelRequest
    }
    @IBOutlet weak var primaryButtonTopConstraints: NSLayoutConstraint!
    @IBOutlet weak var primaryButtonHeightConstraint: NSLayoutConstraint!
    
    var secondaryButtonFunctionality : SecondaryButtonFunctionality?
    
    
    @IBOutlet weak var primaryButton: UIButton!
    
    enum PrimaryButtonFunctionality {
        case Donate
        case ConfirmDonation
    }
    var primaryButtonFunctionality : PrimaryButtonFunctionality?
    
   
    
    
    var request : DetailedRequest? {
        didSet {
            if isViewLoaded {
                setup()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
        setup()
    }
    
    override func localizeStrings() {
        donationRequestLabel.text = "donationrequestnavtitle.label".localized()
        disclaimerLabel.text = "registerdonoralert.label".localized()
        
    }
    
    func setup() {
        if let request = request {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.initializeMap(withLng: request.lng, lat: request.lat)
            }
            self.initializeMiniCard()
            if request.isUserRequest {
                setupViewForMyRequest()
            } else if request.isUserADonator {
                setupViewForActiveRequest()
            } else {
                setupViewForInactiveRequest()
            }
        }
    }
    
    func initializeView() {
        miniCardView.layer.cornerRadius = 20
        miniCardView.dropShadow()
        
        secondaryButton.layer.cornerRadius = secondaryButton.frame.height / 2
        secondaryButton.layer.borderWidth = 2
        secondaryButton.layer.borderColor = ThemeConstants.colorDarkGray.cgColor
        
        primaryButton.layer.cornerRadius = primaryButton.frame.height / 2
        
        bloodTypeBackgroundView.layer.cornerRadius = bloodTypeBackgroundView.frame.height / 2
        backgroundView.addSpecificCornerRadius(forCorners: .Top, radius: 60)
        backgroundView.dropShadow()
    }
    
    func initializeMiniCard() {
        if let request = request {
            
            nameLabel.text = request.fullName
            addressLabel.text = request.address
            bloodBagsCount = request.bloodBags
            donatorsCount = request.donatorsCount
            bloodTypeLabel.text = request.bloodType
        }
    }
    
    func initializeMap(withLng lng: Double, lat: Double){
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lng, zoom: 15.0)
        let view = GMSMapView.map(withFrame: mapView.frame, camera: camera)
        mapView.addSubview(view)
        

        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        marker.map = view
        view.settings.scrollGestures = false
    }
    
    func setupViewForActiveRequest() {
        UIView.animate(withDuration: 0.25) {
            self.disclaimerLabelTopConstraint.constant = 15
            self.disclaimerLabel.isHidden = false
            self.SecondaryButtonTopConstraint.constant = 15
            self.secondaryButtonHeightConstraint.constant = 58
            self.secondaryButton.isHidden = false
            self.primaryButtonFunctionality = .ConfirmDonation
            self.primaryButtonTopConstraints.constant = 16
            self.primaryButton.setTitle("idonated.button".localized(), for: .normal)
            self.secondaryButtonFunctionality = .CancelDonation
            self.secondaryButton.setTitle("canceldonation.button".localized(), for: .normal)
            self.view.layoutIfNeeded()
        }
        
    }
    
    func setupViewForInactiveRequest() {
        UIView.animate(withDuration: 0.25) {
            self.disclaimerLabelTopConstraint.constant = 0
            self.disclaimerLabel.isHidden = true
            self.primaryButtonTopConstraints.constant = 0
            self.secondaryButtonHeightConstraint.constant = 0
            self.secondaryButton.isHidden = true
            self.primaryButtonHeightConstraint.constant = 58
            self.primaryButton.isHidden = false
            
            self.primaryButtonFunctionality = .Donate
            self.primaryButton.setTitle("donate.button".localized(), for: .normal)
            self.view.layoutIfNeeded()
        }
        
    }
    
    func setupViewForMyRequest() {
        UIView.animate(withDuration: 0.25) {
            self.disclaimerLabelTopConstraint.constant = 0
            self.disclaimerLabel.isHidden = true
            self.SecondaryButtonTopConstraint.constant = 0
            self.primaryButtonHeightConstraint.constant = 0
            self.primaryButton.isHidden = true
            self.secondaryButtonHeightConstraint.constant = 58
            self.secondaryButton.isHidden = false
            
            self.secondaryButtonFunctionality = .CancelRequest
            self.secondaryButton.setTitle("cancelrequest.button".localized(), for: .normal)
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func exitButtonPressed(_ sender: Any) {
        guard let presenter = presenter as? RequestPresenter else {fatalError()}
        presenter.exitButtonPressed()
    }
    
    
    @IBAction func secondaryButtonClicked(_ sender: Any) {
        guard let presenter = presenter as? RequestPresenter else {fatalError()}
        presenter.secondaryButtonClicked()
    }
    
    @IBAction func primaryButtonClicked(_ sender: Any) {
        guard let presenter = presenter as? RequestPresenter else {fatalError()}
        presenter.primaryButtonClicked()
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
