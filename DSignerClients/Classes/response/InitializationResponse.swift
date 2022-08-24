
// To parse the JSON, add this file to your project and do:
//
//   let initializationResponse = try? newJSONDecoder().decode(InitializationResponse.self, from: jsonData)

import Foundation

// MARK: - InitializationResponse
public struct InitializationResponse: Codable {
    public let code: Int?
    public let message: String?
    public let responseStatus: ResponseStatus?

    enum CodingKeys: String, CodingKey {
        case code = "Code"
        case message = "Message"
        case responseStatus = "ResponseStatus"
    }
}

