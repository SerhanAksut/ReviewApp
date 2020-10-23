
public enum AppstoreAPIError: Error {
    case url(Error)
    case decoding(Error)
    case noConnection
    case unknown
    
    public var message: String? {
        switch self {
        case .url, .decoding, .unknown:
            return Constants.standardMessage
        case .noConnection:
            return Constants.noConnection
        }
    }
}

// MARK: - Constants
private enum Constants {
    static let standardMessage = "An error occured. Please try again."
    static let noConnection = "Please check your internet connection and try again."
}
