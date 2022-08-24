//
//  ValidateUserResponse.swift
//
//
//  Created by José Mangandid on 11/08/22.
//


import Foundation

// MARK: - ValidateUserResponse
public struct UpdateSignResponse: Codable {
    public var state: UpdateSignState?
    public let errorCode: String?
    public let message: String?
    let signState: String?

    enum CodingKeys: String, CodingKey {
        case signState = "State"
        case errorCode = "ErrorCode"
        case message = "Message"
    }
}

