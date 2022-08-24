//
//  SignFileResponse.swift
//  DSignerClients
//
//  Created by Devel on 15/06/22.
//

import Foundation

// MARK: - SignFileResponse
public struct SignFileResponse: Codable {
    public let code: Int?
    public let message: String?
    public let responseStatus: ResponseStatus?

    enum CodingKeys: String, CodingKey {
        case code = "Code"
        case message = "Message"
        case responseStatus = "ResponseStatus"
    }
}
