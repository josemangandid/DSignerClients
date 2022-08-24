//
//  ValidateUserResponse.swift
//
//
//  Created by José Mangandid on 11/08/22.
//


import Foundation

// MARK: - ValidateUserResponse
public struct ValidateUserResponse: Codable {
    public var userState: UserEnrollmentState?
    public let errorCode: String?
    public let message: String?
    let userSignState: String?

    enum CodingKeys: String, CodingKey {
        case userSignState = "UserState"
        case errorCode = "ErrorCode"
        case message = "Message"
    }
}

