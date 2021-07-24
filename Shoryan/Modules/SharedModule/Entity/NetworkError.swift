//
//  NetworkError.swift
//  BI Premier League
//
//  Created by Ahmed AlSai on 11/03/2021.
//

import UIKit


class NetworkError : BaseError {
    static func getNetwrokError(fromResponseError error: DecodableErrorResponse) -> NetworkError{
        switch error.error.message {
        case "MISSING_PARAMETER":
            return MissingParameterError()
        case "MISSING_URL_PARAMETER":
            return MissingURLParameterError()
        case "INVALID_FORMAT":
            return InvalidFormatError()
        case "USER_NOT_FOUND":
            return UserNotFoundError()
        case "INVALID_CREDENTIALS":
            return InvalidCredentialsError()
        case "UNAUTHORIZED":
            return UnauthorizedError()
        case "INTERNAL_SERVER_ERROR":
            return InternalServerError()
        case "INVALID_CODE":
            return InvalidCodeError()
        case "CODE_EXPIRED":
            return CodeExpiredError()
        case "JWT_EXPIRED":
            return JWTExpiredError()
        case "PHONE_NUMBER_REQUIRED":
            return PhoneNumberRequiredError()
        case "ACCOUNT_NOT_VERIFIED":
            return AccountNotVerifiedError()
        case "NO_ENOUGH_POINTS":
            return NotEnoughPointsError()
        case "USER_ALREADY_EXISTS":
            return UserAlreadyExistsError()
        case "ACCOUNT_ALREADY_VERIFIED":
            return AccountAlreadyVerifiedError()
        case "JWT_NOT_ACTIVE":
            return JWTNotActiveError()
        case "PASSWORD_MISMATCH":
            return PasswordMismatchError()
//        case "INVALID_ID":
//            return InvalidIDError()
        case "REQUESTS_DAILY_LIMIT":
            return RequestsDailyLimitError()
        case "REQUEST_NOT_FOUND":
            return RequestNotFoundError()
        case "AGE_CHECK_FAILS":
            return AgeCheckFailError()
        case "BREAK_TIME_CHECK_FAILS":
            return BreakTimeCheckFails()
        case "INCOMPATIBLE_BLOOD_TYPE":
            return IncompatibleBloodTypeError()
        case "USER_GOING_TO_ANOTHER_REQUEST":
            return UserGoingToAnotherRequestError()
        case "ALREADY_GOING_TO_THIS_REQUEST":
            return AlreadyGoingToThisRequestError()
        case "USER_MUST_BE_IN_COMING_DONORS":
            return UserMustBeInComingDonorsError()
        case "REWARD_NOT_FOUND":
            return RewardNotFoundError()
        case "REDEEMING_ANOTHER_REWARD":
            return RedeemingAnotherRewardError()
        default:
            return UnknownNetworkError()
        }
    }
    
    static func getNetwrokError(fromError error: NSError) -> NetworkError{
        switch error.code {
        case 1009:
            return NoInternetConnectionError()
        default:
            return UnknownNetworkError()
        }
    }
    
}

class EmptyError: BaseError {
    
}

class UnknownNetworkError: NetworkError {
    override init() {
        super.init()
        message = "Unknown error occured"
    }
}

class NoInternetError : NetworkError {
    override init() {
        super.init()
        message = "Your internet connection is unreachable"
    }
}

class MissingParameterError : NetworkError {
    override init() {
        super.init()
        message = "Please make sure you entered all required fields"
    }
}

class MissingURLParameterError: NetworkError {
    override init() {
        super.init()
        message = "Please make sure you entered all required fields"
    }
}

class InvalidFormatError : NetworkError {
    override init() {
        super.init()
        message = "Invalid data format, please make sure you entered all required fields in the correct format"
    }
}

class UserNotFoundError : NetworkError {
    override init() {
        super.init()
        message = "User not found, please make sure the email you use is registered"
    }
}

class InvalidCredentialsError : NetworkError {
    override init() {
        super.init()
        message = "Invalid credentials, please make sure credentials you use are correct"
    }
}

class UnauthorizedError : NetworkError {
    override init() {
        super.init()
        message = "Unauthorized"
    }
}

class InternalServerError : NetworkError {
    override init() {
        super.init()
        message = "There was a problem in the server, please try again"
    }
}

class InvalidCodeError : NetworkError {
    override init() {
        super.init()
        message = "The code you used is invalid, please make sure you use the correct code"
    }
}

class CodeExpiredError : NetworkError {
    override init() {
        super.init()
        message = "The code you used has expired, please request another code"
    }
}

class JWTExpiredError : NetworkError {
    override init() {
        super.init()
        message = "Session expired, please log in again"
    }
}

class PhoneNumberRequiredError : NetworkError {
    override init() {
        super.init()
        message = "Phone number is required before continuing"
    }
}

class AccountNotVerifiedError : NetworkError {
    override init() {
        super.init()
        message = "Your account was not verified after registration, please try registering again"
    }
}

class NotEnoughPointsError : NetworkError {
    override init() {
        super.init()
        message = "notenoughpoints.alert".localized()
    }
}

class InvalidPathError : NetworkError {
    override init() {
        super.init()
        message = "Invalid path"
    }
}

class RequestError : NetworkError {
    override init() {
        super.init()
        message = "There was a problem fetching your request, please try again"
    }
}

class ParseError : NetworkError {
    override init() {
        super.init()
        message = "Parse error"
    }
}

class NoInternetConnectionError : NetworkError {
    override init() {
        super.init()
        message = "Your internet connection is offline, please make sure you are connected to the internet"
    }
}

class UserAlreadyExistsError : NetworkError {
    override init() {
        super.init()
        message = "This user already exists"
    }
}

class AccountAlreadyVerifiedError : NetworkError {
    override init() {
        super.init()
        message = "This account is already verified"
    }
}

class JWTNotActiveError : NetworkError {
    override init() {
        super.init()
        message = "JWT not active"
    }
}

class PasswordMismatchError : NetworkError {
    override init() {
        super.init()
        message = "Password mismatch, please make sure that the password and its confirmation match"
    }
}

class RequestsDailyLimitError: NetworkError {
    override init() {
        super.init()
        message = "You have reached your daily limit of 3 requests"
    }
}

class RequestNotFoundError : NetworkError {
    override init() {
        super.init()
        message = "Blood donation request not found"
    }
}

class AgeCheckFailError : NetworkError {
    override init() {
        super.init()
        message = "You must be 17 years or older to donate blood"
    }
}

class BreakTimeCheckFails : NetworkError {
    override init() {
        super.init()
        message = "You can not donate blood more than once every 3 months"
    }
}

class IncompatibleBloodTypeError : NetworkError {
    override init() {
        super.init()
        message = "Your blood type is incompatible with this request"
    }
}

class UserGoingToAnotherRequestError : NetworkError {
    override init() {
        super.init()
        message = "You are already registered as a donor for another request, please cancel that request first"
    }
}

class AlreadyGoingToThisRequestError : NetworkError {
    override init() {
        super.init()
        message = "You are already registered as a donor for this request"
    }
}

class UserMustBeInComingDonorsError : NetworkError {
    override init() {
        super.init()
        message = "You are already not registered as a donor for this request"
    }
}

class RewardNotFoundError : NetworkError {
    override init() {
        super.init()
        message = "This reward is not available"
    }
}

class RedeemingAnotherRewardError : NetworkError {
    override init() {
        super.init()
        message = "You are already redeeming another reward"
    }
}
