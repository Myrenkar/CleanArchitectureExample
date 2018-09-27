import Foundation

struct Boredom {
    struct GetActivity {
        struct Request: APIRequest {
            var path: String { return "activity" }
        }

        struct Response: Codable {
            let activity: String
            let type: String
            let participants: Int
            let price: Float
            let link: URL?
        }
        
        struct ViewModel {
            let activity: String
            let type: String
            let participants: Int
            let price: Float
        }
    }
}
