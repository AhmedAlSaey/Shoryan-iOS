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
        return false
    }
    
    func initializeApp() {
        ThemeConstants.globalApplicationTheming()
    }
    
    func logInWithPassword(phoneNumber: String, password: String, successHandler: () -> (), failHandler: () -> ()){
        successHandler()
    }
    
    func logInWithCode(phoneNumber: String, code: String, successHandler: () -> (), failHandler: () -> ()){
        successHandler()
    }
    
    func signUp(firstName: String, lastName: String, phoneNumber: String, birthDate: String, bloodType: String, lng: Double, lat: Double, city: String?, governorate: String?, password: String, passwordConfirmation: String, successHandler: () -> (), failHandler: () -> ()){
        
        //TODO: - Fix missing:
        /*
         governorate: "Cairo",
         region: "Nasr City,",
         lat: 31.357096680117373,
         lon: 30.0592406644431,
         */
        successHandler()
    }
    
    func getBloodTypes() -> [String] {
        return ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"]
    }
    func getGenders() -> [String] {
        return ["اُفضل عدم القول", "ذكر", "أنثى"]
    }

}
