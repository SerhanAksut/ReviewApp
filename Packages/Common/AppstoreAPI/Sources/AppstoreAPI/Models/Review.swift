import Foundation

public struct Review: Decodable {
    let id: String
    let author: String
    let rating: UInt
    let title: String
    let content: String
    let version: String
}
