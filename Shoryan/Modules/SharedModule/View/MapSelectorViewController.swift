//
//  MapSelectorViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 25/02/2021.
//

import UIKit
import GooglePlaces
import GoogleMaps

protocol MapSelectorDelegate {
    func didSelectLocation(lng: Double, lat: Double, city: String?, governorate: String?, formattedAddress: String?) -> Void
    func didPressBackButton()
}

class MapSelectorViewController: UIViewController {

    @IBOutlet weak var myLocationButton: UIButton!
    @IBOutlet weak var locationSelectedButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    var mapView: GMSMapView?
    var locationManager = CLLocationManager()
    var delegate: MapSelectorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupMap()
    }
    
    func setupViews() {
        myLocationButton.layer.cornerRadius = myLocationButton.frame.size.height/2
        myLocationButton.dropShadow()
        
        locationSelectedButton.layer.cornerRadius = locationSelectedButton.frame.size.height/2
        locationSelectedButton.dropShadow()
        
        searchButton.layer.cornerRadius = searchButton.frame.height/2
        searchButton.dropShadow()
        
        backButton.layer.cornerRadius = backButton.frame.height/2
        backButton.dropShadow()
    }

    func setupMap() {
        DispatchQueue.main.async {
            let camera = GMSCameraPosition.camera(withLatitude: 30.060148, longitude: 31.323781, zoom: 6.0)
            self.mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
            self.view.addSubview(self.mapView!)
            self.view.sendSubviewToBack(self.mapView!)
            

            // Creates a marker in the center of the map.
//            let marker = GMSMarker()
//            marker.position = CLLocationCoordinate2D(latitude: 30.060148, longitude: 31.323781)
//            marker.title = "Sydney"
//            marker.snippet = "Australia"
//            marker.map = mapView
//
//            print(camera.target)
            }
        
    }
    
    func startLocationManager() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.delegate = self
        locationManager.requestLocation()
    }
    
    
    @IBAction func myLocationButtonSelected(_ sender: Any) {
        startLocationManager()
    }
    
    @IBAction func locationSelectedButtonClicked(_ sender: Any) {
        if let lat = mapView?.camera.target.latitude, let lon = mapView?.camera.target.longitude {
            performGoogleSearch(long: lon, lat: lat)
            
        }
        
        
    }
    @IBAction func backButtonClicked(_ sender: Any) {
        delegate?.didPressBackButton()
    }
    
    func performGoogleSearch(long: Double, lat: Double) {

        var components = URLComponents(string: "https://maps.googleapis.com/maps/api/geocode/json")!
        let key = URLQueryItem(name: "key", value: "AIzaSyBdof_5MRwUAFSOI0KkO5BMhDvtWC5qiyQ")
        let latlng = URLQueryItem(name: "latlng", value: "\(lat),\(long)")
        let language = URLQueryItem(name: "language", value: "ar")
        components.queryItems = [latlng, language, key]

        let task = URLSession.shared.dataTask(with: components.url!) { [self] data, response, error in
            guard let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, error == nil else {
                print(String(describing: response))
                print(String(describing: error))
                return
            }

            guard let json = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any] else {
                showAlert(title: "Error", message: "Not JSON format expected")
                print(String(data: data, encoding: .utf8) ?? "Not string?!?")
                return
            }

            guard let results = json["results"] as? [[String: Any]],
                let status = json["status"] as? String,
                status == "OK" else {
                    showAlert(title: "Error", message: "No results found")
                    print(String(describing: json))
                    return
            }

            DispatchQueue.main.async {
//                let strings = results.compactMap { $0["formatted_address"] as? String }
                var city : String?
                var governorate: String?
                let lng = long
                let lat = lat
                let formattedAddress = results[0]["formatted_address"] as? String
                for component in results[0]["address_components"] as! [[String: Any]] {
                    let types = component["types"] as? [String]
                    if types != nil {
                        if types?.contains("administrative_area_level_2") ?? false {
                            city = component["short_name"] as? String
                        } else if types?.contains("administrative_area_level_1") ?? false {
                            governorate = component["short_name"] as? String
                        }
                    }
                }
                self.delegate?.didSelectLocation(lng: lng, lat: lat, city: city, governorate: governorate, formattedAddress: formattedAddress)
            }
        }

        task.resume()
    }
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        
        // Specify the place data types to return.
        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |
                                                    UInt(GMSPlaceField.coordinate.rawValue))!
        autocompleteController.placeFields = fields
        
        // Specify a filter.
        let filter = GMSAutocompleteFilter()
        filter.type = .address
        autocompleteController.autocompleteFilter = filter
        
        // Display the autocomplete view controller.
        present(autocompleteController, animated: true, completion: nil)
    }
    
    func navigateMapTo(lon: Double, lat: Double){
        let newLocation = GMSCameraPosition.camera(
            withLatitude: lat,
            longitude: lon,
          zoom: 15
        )
        mapView?.camera = newLocation
        dismiss(animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension MapSelectorViewController: GMSAutocompleteViewControllerDelegate {

  // Handle the user's selection.
  func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
//    print("Place name: \(place.name)")
//    print("Longitude: \(place.coordinate.longitude)")
//    print("Latitude: \(place.coordinate.latitude)")
//    if let addressComponents = place.addressComponents {
//        for component in addressComponents {
//            if component.types[0] == "administrative_area_level_1" {
//                print("Governorate: \(component.shortName)")
//            } else if component.types[0] == "administrative_area_level_2" {
//                print("City: \(component.shortName)")
//            }
//        }
//    }
//    print("Formatted address: \(place.formattedAddress)")
//    print("Place attributions: \(place.attributions)")
    navigateMapTo(lon: place.coordinate.longitude, lat: place.coordinate.latitude)
    
    
  }

  func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
    //TODO: - handle the error.
    showAlert(title: "Error", message: error.localizedDescription)
  }

  // User canceled the operation.
  func wasCancelled(_ viewController: GMSAutocompleteViewController) {
    dismiss(animated: true, completion: nil)
  }

  // Turn the network activity indicator on and off again.
  func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
  }

  func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
  }
    
    

}

//MARK: - CLLocationManagerDelegate
extension MapSelectorViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            navigateMapTo(lon: lon, lat: lat)
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
