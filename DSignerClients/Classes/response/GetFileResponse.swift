//
//  GetFileResponse.swift
//  DSignerClients
//
//  Created by Devel on 14/06/22.
//

import Foundation

// MARK: - GetFileResponse
public struct GetFileResponse: Codable {
    public let fileData: String?
    public let name: String?
    public let caseNo: Int?
    public let expirationDate: Date?
    public let createdDate: Date?
    public let code: Int?
    public let message: String?

    enum CodingKeys: String, CodingKey {
        case fileData = "FileData"
        case name = "Name"
        case caseNo = "CaseNo"
        case expirationDate = "ExpirationDate"
        case createdDate = "CreatedDate"
        case code = "Code"
        case message = "Message"
    }
}
