import Foundation

struct BoredService: APIService {
    var host: String { return "boredapi.com" }
    var root: String { return "api" }
    var scheme: Scheme { return .HTTP }
}
