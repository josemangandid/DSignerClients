//
//  RejectFileResponse.swift
//  DSignerClients
//
//  Created by Devel on 14/06/22.
//

import Foundation

// MARK: - RejectFileResponse
public struct RejectFileResponse: Codable {
    public let code: Int?
    public let message: String?
    public let responseStatus: ResponseStatus?

    enum CodingKeys: String, CodingKey {
        case code = "Code"
        case message = "Message"
        case responseStatus = "ResponseStatus"
    }
}
