
import Foundation

public struct Review: Decodable {
    public let id: String
    public let author: String
    public let rating: UInt
    public let title: String
    public let content: String
    public let version: String
}
