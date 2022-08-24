
// To parse the JSON, add this file to your project and do:
//
//   let getFilesResponse = try? newJSONDecoder().decode(GetFilesResponse.self, from: jsonData)

import Foundation

// MARK: - GetFilesResponse
public struct GetFilesResponse: Codable {
    public let files: [FileListItem]?
    public let responseStatus: ResponseStatus?

    enum CodingKeys: String, CodingKey {
        case files = "Files"
        case responseStatus = "ResponseStatus"
    }
}
