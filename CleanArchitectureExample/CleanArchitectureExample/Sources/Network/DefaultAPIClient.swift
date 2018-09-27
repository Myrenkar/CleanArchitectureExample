import Foundation

final class DefaultAPIClient: APIClient {

    // MARK: Properties

    private let session: URLSession

    // MARK: Initializers

    /// Initializes DefaultAPIClient
    ///
    /// - Parameter session: URLSession to use - default is `.shared`
    init(session: URLSession = .shared) {
        self.session = session
    }

    func perform(request: APIRequest, completionHandler: @escaping (Result<APIResponse>) -> ()) {
        send(request: request, completionHandler: completionHandler)
    }

    // MARK: Private

    private func send(request: APIRequest, completionHandler: @escaping (Result<APIResponse>) -> ()) {
        do {
            var urlRequest = try URLRequest(request: request)
            urlRequest.cachePolicy = .useProtocolCachePolicy

            let task = session.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    if (error as NSError).code == -1009 {
                        completionHandler(.failure(APIError.internetConnectionUnavailable))
                    } else {
                        completionHandler(.failure(error))
                    }
                } else if let response = response as? HTTPURLResponse {
                    if 200..<300 ~= response.statusCode {
                        completionHandler(.success(APIResponse(data: data, response: response)))
                    } else if response.statusCode == 401 {
                        completionHandler(.failure(APIError.unAuthorized))
                    } else {
                        completionHandler(.failure(APIError.unexpectedStatusCode(statusCode: response.statusCode)))
                    }
                } else {
                    completionHandler(.failure(APIError.noResponse))
                }
            }
            task.resume()
        } catch let error {
            completionHandler(.failure(error))
        }
    }
}
