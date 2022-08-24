//
//  SendFileEmailResponse.swift
//  
//
//  Created by José Mangandid on 11/08/22.
//


import Foundation

// MARK: - SendFileEmailResponse
public struct SendFileEmailResponse: Codable {
    public let code: Int?
    public let errorCode: String?
    public let message: String?

    enum CodingKeys: String, CodingKey {
        case code = "Code"
        case errorCode = "ErrorCode"
        case message = "Message"
    }
}

