//
//  ResponseStatus.swift
//  DSignerClients
//
//  Created by Devel on 14/06/22.
//

import Foundation

// MARK: - ResponseStatus
public struct ResponseStatus: Codable {
    public let errorCode, message, stackTrace: String?
    public let errors: [ResponseError]?
    public let meta: Dictionary<String, String>?

    enum CodingKeys: String, CodingKey {
        case errorCode = "ErrorCode"
        case message = "Message"
        case stackTrace = "StackTrace"
        case errors = "Errors"
        case meta = "Meta"
    }
}

