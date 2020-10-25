
import Foundation

public struct Review: Decodable {
    public let id: String
    let author: String
    let rating: UInt
    public let title: String
    public let content: String
    public let version: String
}

// MARK: - External Helpers
public extension Review {
    var ratingVersionText: String {
        var result = ""
        for _ in 0..<rating {
            result += "⭐️"
        }
        return "\(result) (ver: \(version))"
    }
    
    var authorText: String {
        "from: \(author)"
    }
}
