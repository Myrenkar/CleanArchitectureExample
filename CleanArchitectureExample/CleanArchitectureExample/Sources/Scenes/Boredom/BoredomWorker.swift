import Foundation

protocol BoredomWorkerProtocol {
    func getActivities(request: APIRequest, completionHandler: @escaping (Result<Boredom.GetActivity.Response>) -> ())
}

final class BoredomWorker: BoredomWorkerProtocol {

    // MARK: - Properties

    private let apiClient: APIClient

    // MARK: - Initialization

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    // MARK: - BoredomWorkerProtocol

    func getActivities(request: APIRequest, completionHandler: @escaping (Result<Boredom.GetActivity.Response>) -> ()) {
        apiClient.perform(request: request) { result in
            switch result {
                case .success(let response):
                    guard let data = response.data else {
                        completionHandler(.failure(APIError.missingData))
                        return
                    }
                    do {
                        let activity = try JSONDecoder().decode(Boredom.GetActivity.Response.self, from: data)
                        completionHandler(.success(activity))
                    } catch let error {
                        completionHandler(.failure(error))
                    }
                case .failure(let error):
                    completionHandler(.failure(error))
            }
        }
    }
}
