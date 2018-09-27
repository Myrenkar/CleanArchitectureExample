import Foundation

protocol APIClient {
    func perform(request: APIRequest, completionHandler: @escaping (Result<APIResponse>) -> ())
    
}
