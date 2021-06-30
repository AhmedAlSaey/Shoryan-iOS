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

