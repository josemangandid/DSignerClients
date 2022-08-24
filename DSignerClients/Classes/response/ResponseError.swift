//
//  Error.swift
//  DSignerClients
//
//  Created by Devel on 14/06/22.
//

import Foundation

// MARK: - Error
public struct ResponseError: Codable {
    public let errorCode, fieldName, message: String?
    public let meta: Dictionary<String, String>?

    enum CodingKeys: String, CodingKey {
        case errorCode = "ErrorCode"
        case fieldName = "FieldName"
        case message = "Message"
        case meta = "Meta"
    }
}
