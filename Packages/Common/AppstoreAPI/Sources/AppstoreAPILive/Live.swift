
import Foundation
import NetworkCore
import AppstoreAPI

public extension AppstoreAPI {
    static let live = Self(
        reviewList: { completion in
            requestLoader.load(request: .reviewList) { result in
                completion(result.mapError(convertError))
            }
        }
    )
}

private let requestLoader = RequestLoader(
    baseURL: URL(string: "https://itunes.apple.com/")!,
    standardHeaders: [:]
)

// MARK: - Internal Helpers
private func convertError(_ error: Error) -> AppstoreAPIError {
    if let appStoreApiError = error as? AppstoreAPIError {
        return appStoreApiError
    }
    if let networkError = error as? NetworkError {
        switch networkError {
        case .noConnection:
            return .noConnection
        case .url(let error):
            return .url(error)
        }
    }
    return .unknown
}
