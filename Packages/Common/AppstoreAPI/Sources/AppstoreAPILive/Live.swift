
import Foundation
import NetworkCore
import AppstoreAPI

private let requestLoader = RequestLoader(
    baseURL: URL(string: "https://itunes.apple.com/")!,
    standardHeaders: [:]
)

public extension AppstoreAPI {
    static let live = Self(
        reviewList: { completion in
//            completion(Result.success([]))
        }
    )
}
