import Foundation

enum APIError: Error {
    case incorrectURL(url: String)
    case unexpectedStatusCode(statusCode: Int)
    case noResponse
    case missingData
    case unAuthorized
    case internetConnectionUnavailable
}
