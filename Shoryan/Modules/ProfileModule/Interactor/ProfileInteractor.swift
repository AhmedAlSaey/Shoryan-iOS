//
//  ProfileInteractor.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import Foundation

class ProfileInteractor: BaseInteractor {
    
    static let shared = ProfileInteractor()
    
    func getUserPoints() -> String {
        "\(AppUser.shared.points ?? 0)".localizeDigits
    }
    
    func getUserDonation() -> String {
        "\(AppUser.shared.donations ?? 0)".localizeDigits
    }
    
    func getUserFistName() -> String {
        "\(AppUser.shared.firstName ?? "")"
    }
    
    func getUserLastName() -> String {
        "\(AppUser.shared.lastName ?? "")"
    }
    
    func getUserGovernorate() -> String {
        "\(AppUser.shared.governorate ?? "")"
    }
    
    func getUserRegion() -> String {
        "\(AppUser.shared.region ?? "")"
    }
    
    func getUserLatitude() -> Double {
        AppUser.shared.lat!
    }
    
    func getUserLongitude() -> Double {
        AppUser.shared.long!
    }
    
    func getUserBirthDay() -> Int {
        AppUser.shared.birthDay!
    }
    
    func getUserBirthMonth() -> Int {
        AppUser.shared.birthMonth!
    }
    
    func getUserBirthYear() -> Int {
        AppUser.shared.birthYear!
    }
    
    func getUserBloodType() -> String {
        "\(AppUser.shared.bloodType ?? "")"
    }
    
    func getUserGenderKey() -> String {
        "\(AppUser.shared.genderKey ?? "")"
    }
    
    func getUserGenderName() -> String {
        genderCodeToName(code: getUserGenderKey())
    }
    
    func clearUserData() {
        AppUser.shared.clearUserData()
    }
    
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
    
    func changePassword(oldPassword: String, newPassword: String, passwordConfirmation: String, completionHandler: @escaping (Result<UserDataResponse, BaseError>) -> ()){
        
        ProfileModuleAPIManager.changePassword(accessToken: AppUser.shared.accessToken!, oldPassword: oldPassword, newPassword: newPassword, simulatedDelay: 0.2) { result in
            completionHandler(result.mapError({ (error) -> BaseError in
                return error as BaseError
            }))
        }
    }
    
    func genderCodeToName(code: String) -> String{
        switch code {
        case "M":
            return "Male".localized()
        case "F":
            return "Female".localized()
        default:
            fatalError()
        }
    }
    
    func editUserInfo(firstName: String, lastName: String, birthDate: Date, bloodType: String, gender: String, lng: Double, lat: Double, governorate: String, region: String, completionHandler: @escaping (Result<UserDataResponse, BaseError>) -> ()){
        
        
        ProfileModuleAPIManager.editUserInfo(
            accessToken: AppUser.shared.accessToken!,
            firstName: firstName,
            lastName: lastName,
            governorate: governorate,
            region: region,
            lat: lat,
            lng: lng,
            bloodType: bloodType,
            gender: reformatGender(arabicGender: gender),
            birthYear: birthDate.get(.year),
            birthMonth: birthDate.get(.month),
            birthDay: birthDate.get(.day),
            simulatedDelay: 0.2) { (result) in
            if case .success(let userDataResponse) = result {
                AppUser.shared.userID = userDataResponse.user._id
                AppUser.shared.bloodType = userDataResponse.user.bloodType
                AppUser.shared.points = userDataResponse.user.points
                AppUser.shared.donations = userDataResponse.user.numberOfDonations
                AppUser.shared.firstName = userDataResponse.user.name.firstName
                AppUser.shared.lastName = userDataResponse.user.name.lastName
                AppUser.shared.birthDay = userDataResponse.user.birthDate.day
                AppUser.shared.birthMonth = userDataResponse.user.birthDate.month
                AppUser.shared.birthYear = userDataResponse.user.birthDate.year
                AppUser.shared.governorate = userDataResponse.user.location.governorate
                AppUser.shared.region = userDataResponse.user.location.region
                AppUser.shared.lat = userDataResponse.user.location.latitude
                AppUser.shared.long = userDataResponse.user.location.longitude
                AppUser.shared.genderKey = userDataResponse.user.gender
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
        return ["Male".localized(), "Female".localized()]
    }
    
    func reformatGender(arabicGender: String) -> String {
        switch arabicGender {
        case "Male".localized():
            return "M"
        case "Female".localized():
            return "F"
        default:
            fatalError()
        }
    }

}
