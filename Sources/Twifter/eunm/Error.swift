//
//  Error.swift
//  
//
//  Created by 宮本大新 on 2022/04/23.
//

import Foundation

public enum ErrorCode: Error {
    case Error32
    case Error34
    case Error64
    case Error68
    case Error88
    case Error89
    case Error92
    case Error130
    case Error131
    case Error135
    case Error154
    case Error161
    case Error179
    case Error185
    case Error187
    case Error193
    case Error215
    case Error226
    case Error231
    case Error251
    case Error261
    case Error271
    case Error272
    case Error326
    case Error324
    case Error354
    case Error999
}

extension ErrorCode: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .Error32:
            return "Could not authenticate you"
        case .Error34:
            return "Sorry, that page does not exist"
        case .Error64:
            return "Your account is suspended and is not permitted to access this feature"
        case .Error68:
            return "The Twitter REST API v1 is no longer active. Please migrate to API v1.1. https://dev.twitter.com/rest/public"
        case .Error88:
            return "Rate limit exceeded"
        case .Error89:
            return "Invalid or expired token"
        case .Error92:
            return "SSL is required"
        case .Error130:
            return "Over capacity"
        case .Error131:
            return "Internal error"
        case .Error135:
            return "Could not authenticate you"
        case .Error154:
            return "No direct message with that ID found"
        case .Error161:
            return "You are unable to follow more people at this time"
        case .Error179:
            return "Sorry, you are not authorized to see this status"
        case .Error185:
            return "User is over daily status update limit"
        case .Error187:
            return "Status is a duplicate"
        case .Error193:
            return "One or more of the uploaded media is too large"
        case .Error215:
            return "Bad authentication data"
        case .Error226:
            return "This request looks like it might be automated. To protect our users from spam and other malicious activity, we can’t complete this action right now"
        case .Error231:
            return "User must verify login"
        case .Error251:
            return "This endpoint has been retired and should not be used"
        case .Error261:
            return "Application cannot perform write actions"
        case .Error271:
            return "You can’t mute yourself"
        case .Error272:
            return "You are not muting the specified user"
        case .Error326:
            return "To protect our users from spam and other malicious activity, this account is temporarily locked. Please log in to https://twitter.com to unlock your account"
        case .Error324:
            return "Image dimensions must be >= 4x4 and <= 8192x8192"
        case .Error354:
            return "The text of your direct message is over the max character limit"
        case .Error999:
            return "Please report this to the developer"
        }
    }
}
