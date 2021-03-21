//
//  LaunchInteractor.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/12/2020.
//  
//

import Foundation

class LaunchInteractor {
    
    static let shared = LaunchInteractor()
    

    func getFirstNameValidationFunction() -> ((String) -> Bool){
        RegExHandler.nameRegEx.self
    }
    func getLastNameValidationFunction() -> ((String) -> Bool){
        RegExHandler.nameRegEx.self
    }
    func getPhoneNumberValidationFunction() -> ((String) -> Bool){
        RegExHandler.phoneNumberRegEx.self
    }
    func getBirthDateValidationFunction() -> ((String) -> Bool){
        RegExHandler.notEmptyRegEx.self
    }
    func getBloodTypeValidationFunction() -> ((String) -> Bool){
        RegExHandler.notEmptyRegEx.self
    }
    func getGenderValidationFunction() -> ((String) -> Bool){
        RegExHandler.notEmptyRegEx.self
    }
    func getLocationValidationFunction() -> ((String) -> Bool){
        RegExHandler.notEmptyRegEx.self
    }
    func getPasswordValidationFunction() -> ((String) -> Bool){
        RegExHandler.fairPasswordRegEx.self
    }
    func getPasswordConfirmationValidationFunction() -> ((String) -> Bool){
        RegExHandler.fairPasswordRegEx.self
    }

    
    func isUserSignedIn() -> Bool {
        return AppUser.shared.isUserAuthenticated()
    }
    
    func initializeApp() {
        ThemeConstants.globalApplicationTheming()
    }
    
    func logInWithPassword(phoneNumber: String, password: String, completionHandler: @escaping (Result<LoginPasswordResponse, NetworkError>) -> ()){
        LaunchModuleAPIManager.authenticateUserPassword(phoneNumber: phoneNumber, password: password, simulatedDelay: 0.2) { (result) in
            if case .success(let result) = result {
                AppUser.shared.saveNewUserAcessTokens(userData: result)
            }
            completionHandler(result)
        }
    }
    
    func logInWithCode(phoneNumber: String, code: String, successHandler: () -> (), failHandler: () -> ()){
        successHandler()
    }
    
    func signUp(firstName: String, lastName: String, phoneNumber: String, birthDate: Date, bloodType: String, gender: String, lng: Double, lat: Double, governorate: String, region: String, password: String, completionHandler: @escaping (Result<RegisterResponse, BaseError>) -> ()){
        
        
        LaunchModuleAPIManager.registerUser(firstName: firstName, lastName: lastName, phoneNumber: Int(phoneNumber)!, password: password, governorate: governorate, region: region, lat: lat, lng: lng, bloodType: bloodType, gender: translateGender(arabicGender: gender), birthYear: birthDate.get(.year), birthMonth: birthDate.get(.month), birthDay: birthDate.get(.day), simulatedDelay: 0.2) { (result) in
            if case .success(let result) = result {
                AppUser.shared.saveNewUserAcessTokens(userData: result)
            }
            completionHandler(result.mapError({ (error) -> BaseError in
                return error as BaseError
            }))
            
        }
    }
    
    func getBloodTypes() -> [String] {
        return ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"]
    }
    func getGenders() -> [String] {
        return ["افضل عدم القول", "ذكر", "أنثى"]
    }
    
    func translateGender(arabicGender: String) -> String {
        switch arabicGender {
        case "ذكر":
            return "Male"
        case "أنثى":
            return "Female"
        case "افضل عدم القول":
            return "Prefer not to say"
        default:
            fatalError()
        }
    }

}
