//
//  FileListItem.swift
//  DSignerClients
//
//  Created by Devel on 14/06/22.
//

import Foundation

// MARK: - FileListItem
public struct FileListItem: Codable {
    public let fileId: Int?
    public let name: String?
    public let caseNo: Int?
    public let expirationDate: Date?
    public let createdDate: Date?

    enum CodingKeys: String, CodingKey {
        case fileId = "FileId"
        case name = "Name"
        case caseNo = "CaseNo"
        case expirationDate = "ExpirationDate"
        case createdDate = "CreatedDate"
    }
}
